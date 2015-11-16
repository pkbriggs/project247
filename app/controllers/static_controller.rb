class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def quiz1_business_name
  end

  def quiz1_name_matches
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
