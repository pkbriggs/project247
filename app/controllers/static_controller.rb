class StaticController < ApplicationController
  def index
  end

  def survey
    @questions = SurveyQuestion.all_questions
  end

  def quiz1
  end

  def quiz2
  end

  def quiz3
  end
end
