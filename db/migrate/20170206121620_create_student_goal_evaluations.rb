class CreateStudentGoalEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :student_goal_evaluations do |t|
      t.integer :student_goal_id
      t.text :goal_evaluation
      t.text :achivement_tools_evaluation
      t.integer :intermediate_score

      t.timestamps
    end
  end
end
