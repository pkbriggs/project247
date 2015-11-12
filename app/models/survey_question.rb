class SurveyQuestion < ActiveRecord::Base
  def self.all_questions
    return [
      "What is the name of your business?",
      "Where is your business located?",
      "On average, how many customers do you serve per day?"
      # TODO: Add more
    ]
  end
end
