class StudentGoalEvaluation < ApplicationRecord
  belongs_to :student_goal

  def score 
    self.intermediate_score
  end
end
