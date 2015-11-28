class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def quiz1_business_name
    if request.post?
      session[:business_name] = default(params["business_name"], "Sweet Inspriations")
      redirect_to action: "quiz1_name_matches"
    end
  end

  def quiz1_name_matches
    if request.get?
      @business_name = session[:business_name]
    elsif request.post?
      session[:business_match] = (params[:match] == "yes")
      redirect_to action: "quiz1_verify_details"
    end
  end

  def quiz1_verify_details
    if request.post?
      session[:business_name] = default(params[:business_name], "Sweet Inspriations")
      session[:address] = default(params[:address], "123 Main Street, San Francisco, CA, 12345")
      session[:primary_products] = default(params[:primary_products], "cake coffee")
      redirect_to action: "quiz2"
    end
  end

  def quiz2
    if request.post?
      session[:average_num_daily_customers] = default(params[:average_num_daily_customers], 50)
      session[:most_known_product] = default(params[:most_known_product], "cake")
      session[:product_interested_in_selling] = default(params[:product_interested_in_selling], "coffee")
      redirect_to action: "quiz3"
    end
  end

  def quiz3
    if request.post?
      session[:community_involvement] = default(params[:community_involvement], "3")
      session[:biggest_priority] = default(params[:biggest_priority], "5")
      session[:customer_satisfaction_importance] = default(params[:customer_satisfaction_importance], "4")
      redirect_to action: "matches"
    end
  end

  def matches

  end

  def match_detail
    @match_number = params[:match]
  end

  def seed_data
    if request.post?
      lorem_ipsum = "Lorem ipsum sit amet, consectur adipiscing elit sed do eiusmod tempor inciditunt ut labore et dolore magnum."

      session[:possible_match_name] = default(params["possible_match_name"], "Sweet Inspriations")
      session[:possible_match_address] = default(params["possible_match_address"], "555 Main Street, San Francisco, CA, 82135")

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

end
