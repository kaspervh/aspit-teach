class CreateStudentGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :student_goals do |t|
      t.integer :user_id
      t.string :goal_name
      t.text :main_goal
      t.text :learning_goal
      t.text :fufillment_tools
      t.text :fufillment_criteria
      t.integer :beginning_score
      t.boolean :resolved

      t.timestamps
    end
  end
end
