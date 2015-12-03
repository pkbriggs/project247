class StaticController < ApplicationController
  before_filter :seed_data_check

  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def quiz1_business_name
    if request.post?
      session[:business_name] = default(params["business_name"], "Sweet Inspriations")
      session[:quiz_complete] = 1 if session[:quiz_complete] != 5
      redirect_to action: "quiz1_name_matches"
    end
  end

  def quiz1_name_matches
    if request.get?
      @business_name = session[:business_name]
      @image = "sweet_inspiration.jpg"
      if session[:fixed_path] == 2
        @image = "painting.jpg"
      end
    elsif request.post?
      session[:business_match] = (params[:match] == "yes")
      session[:quiz_complete] = 2 if session[:quiz_complete] != 5
      redirect_to action: "quiz1_verify_details"
    end
  end

  def quiz1_verify_details
    if request.post?
      session[:business_name] = default(params[:business_name], "Sweet Inspriations")
      session[:address] = default(params[:address], "123 Main Street, San Francisco, CA, 12345")
      session[:primary_products] = default(params[:primary_products].split(","), ["cake", "coffee"])
      session[:quiz_complete] = 3 if session[:quiz_complete] != 5
      redirect_to action: "quiz2"
    end
  end

  def quiz2
    if request.post?
      session[:average_num_daily_customers] = default(params[:average_num_daily_customers], 50)
      session[:most_known_product] = default(params[:most_known_product], "cake")
      session[:product_interested_in_selling] = default(params[:product_interested_in_selling], "coffee")
      session[:quiz_complete] = 4 if session[:quiz_complete] != 5
      redirect_to action: "quiz3"
    end
  end

  def quiz3
    if request.post?
      session[:community_involvement] = default(params[:community_involvement], "3")
      session[:biggest_priority] = default(params[:biggest_priority], "5")
      session[:customer_satisfaction_importance] = default(params[:customer_satisfaction_importance], "4")
      session[:quiz_complete] = 5 if session[:quiz_complete] != 5
      redirect_to action: "matches"
    end
  end

  def matches
    @background_images = set_background_images()
  end

  def match_detail
    @match_number = params[:match]
    images = set_background_images()
    @image = images[@match_number.to_i - 1]
  end

  def seed_data
    if request.post?
      lorem_ipsum = "Lorem ipsum sit amet, consectur adipiscing elit sed do eiusmod tempor inciditunt ut labore et dolore magnum."

      session[:possible_match_name] = default(params["possible_match_name"], "Sweet Inspriations")
      session[:possible_match_address] = default(params["possible_match_address"], "555 Main Street, San Francisco, CA, 82135")

      session[:fixed_path] = 1
      if session[:possible_match_name] == "Bruce Kent"
        session[:fixed_path] = 2
      end

      session[:top_matches_1_name] = default(params["top_matches_1_name"], "Sweet Delight Bakery")
      session[:top_matches_1_description] = default(params["top_matches_1_description"], lorem_ipsum)
      session[:top_matches_1_product_match_1] = default(params["top_matches_1_product_match_1"], "cupcakes")
      session[:top_matches_1_product_match_2] = default(params["top_matches_1_product_match_2"], "cookies")
      session[:top_matches_1_match_reason_1] = default(params["top_matches_1_match_reason_1"], "Highly compatible products")
      session[:top_matches_1_match_reason_2] = default(params["top_matches_1_match_reason_2"], "High levels of community involvement")
      session[:top_matches_1_match_reason_3] = default(params["top_matches_1_match_reason_3"], "Similar business ideologies")

      session[:top_matches_2_name] = default(params["top_matches_2_name"], "San Francisco Coffee Co")
      session[:top_matches_2_description] = default(params["top_matches_2_description"], lorem_ipsum)
      session[:top_matches_2_product_match_1] = default(params["top_matches_2_product_match_1"], "coffee")
      session[:top_matches_2_product_match_2] = default(params["top_matches_2_product_match_2"], "espresso")
      session[:top_matches_2_match_reason_1] = default(params["top_matches_2_match_reason_1"], "Highly complementary products")
      session[:top_matches_2_match_reason_2] = default(params["top_matches_2_match_reason_2"], "High levels of community involvement")
      session[:top_matches_2_match_reason_3] = default(params["top_matches_2_match_reason_3"], "Similar business ideologies")

      session[:top_matches_3_name] = default(params["top_matches_3_name"], "Tea Time")
      session[:top_matches_3_description] = default(params["top_matches_3_description"], lorem_ipsum)
      session[:top_matches_3_product_match_1] = default(params["top_matches_3_product_match_1"], "tea")
      session[:top_matches_3_product_match_2] = default(params["top_matches_3_product_match_2"], "honey")
      session[:top_matches_3_match_reason_1] = default(params["top_matches_3_match_reason_1"], "Highly compatible products")
      session[:top_matches_3_match_reason_2] = default(params["top_matches_3_match_reason_2"], "High levels of community involvement")
      session[:top_matches_3_match_reason_3] = default(params["top_matches_3_match_reason_3"], "Similar business ideologies")

      flash[:seed_data_notice] = true
      session[:is_match_data_complete] = true
      redirect_to action: "index"
    end
  end

  private

  def default(input_data, default)
    if input_data && input_data.length > 0
      return input_data
    else
      return default
    end
  end

  def seed_data_check
    if !session[:is_match_data_complete]
      lorem_ipsum = "Lorem ipsum sit amet, consectur adipiscing elit sed do eiusmod tempor inciditunt ut labore et dolore magnum."
      reason_1 = "Highly compatible products"
      reason_2 = "High levels of community involvement"
      reason_3 = "Similar business ideologies"

      session[:possible_match_name] = "Sweet Inspriations" if !session[:possible_match_name]
      session[:possible_match_address] = "555 Main Street, San Francisco, CA, 82135" if !session[:possible_match_address]

      session[:fixed_path] = 1

      session[:top_matches_1_name] = "Sweet Delight Bakery" if !session[:top_matches_1_name]
      session[:top_matches_1_description] =  lorem_ipsum if !session[:top_matches_1_description]
      session[:top_matches_1_product_match_1] = "cupcakes" if !session[:top_matches_1_product_match_1]
      session[:top_matches_1_product_match_2] = "cookies" if !session[:top_matches_1_product_match_2]
      session[:top_matches_1_match_reason_1] = reason_1 if !session[:top_matches_1_match_reason_1]
      session[:top_matches_1_match_reason_2] = reason_2 if !session[:top_matches_1_match_reason_2]
      session[:top_matches_1_match_reason_3] = reason_3 if !session[:top_matches_1_match_reason_3]

      session[:top_matches_2_name] = "San Francisco Coffee Co" if !session[:top_matches_2_name]
      session[:top_matches_2_description] =  lorem_ipsum if !session[:top_matches_2_description]
      session[:top_matches_2_product_match_1] = "coffee" if !session[:top_matches_2_product_match_1]
      session[:top_matches_2_product_match_2] = "espresso" if !session[:top_matches_2_product_match_2]
      session[:top_matches_2_match_reason_1] = reason_1 if !session[:top_matches_2_match_reason_1]
      session[:top_matches_2_match_reason_2] = reason_2 if !session[:top_matches_2_match_reason_2]
      session[:top_matches_2_match_reason_3] = reason_3 if !session[:top_matches_2_match_reason_3]

      session[:top_matches_3_name] = "Tea Time" if !session[:top_matches_3_name]
      session[:top_matches_3_description] =  lorem_ipsum if !session[:top_matches_3_description]
      session[:top_matches_3_product_match_1] = "tea" if !session[:top_matches_3_product_match_1]
      session[:top_matches_3_product_match_2] = "honey" if !session[:top_matches_3_product_match_2]
      session[:top_matches_3_match_reason_1] = reason_1 if !session[:top_matches_3_match_reason_1]
      session[:top_matches_3_match_reason_2] = reason_2 if !session[:top_matches_3_match_reason_2]
      session[:top_matches_3_match_reason_3] = reason_3 if !session[:top_matches_3_match_reason_3]

      session[:is_match_data_complete] = true # Marks that we  don't need to set defaults again
    end

    if !session[:quiz_complete] || session[:quiz_complete] < 5
      session[:business_name] = "Sweet Inspriations" if !session[:business_name]
      session[:business_match] = "yes" if !session[:business_match]

      session[:address] = "123 Main Street, San Francisco, CA, 12345" if !session[:address]
      session[:primary_products] = ["cake", "coffee"] if !session[:primary_products]

      session[:average_num_daily_customers] = 50 if !session[:average_num_daily_customers]
      session[:most_known_product] = "cake" if !session[:most_known_product]
      session[:product_interested_in_selling] = "coffee" if !session[:product_interested_in_selling]

      session[:community_involvement] = "3" if !session[:community_involvement]
      session[:biggest_priority] = "5" if  !session[:biggest_priority]
      session[:customer_satisfaction_importance] = "4" if !session[:customer_satisfaction_importance]

      session[:quiz_complete] = 5 # Marks that we  don't need to set defaults again
    end
  end

  def set_background_images()
    images = ["business_backdrop1.png", "business_backdrop2.png", "business_backdrop3.png"]
    if session[:fixed_path] == 2
      images = ["business_backdrop3.png", "castro_theater.jpg", "art_store.jpg"]
    end

    return images
  end

end
