class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def quiz1_business_name
    if request.post?
      session[:business_name] = params["business_name"]
      redirect_to action: "quiz1_name_matches"
    end
  end

  def quiz1_name_matches
    if request.get?
      @business_name = session[:business_name]
    elsif request.post?
      redirect_to action: "quiz1_verify_details"
    end
  end

  def quiz1_verify_details
  end

  def quiz2
  end

  def quiz3
  end

  def matches

  end

  def match_detail
  end

end
