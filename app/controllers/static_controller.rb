class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end
end
