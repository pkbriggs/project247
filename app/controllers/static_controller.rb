class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def matches
  end

  def match_detail
  end
end
