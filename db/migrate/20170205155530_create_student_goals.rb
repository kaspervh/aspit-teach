class CreateStudentGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :student_goals do |t|
      t.integer :user_id
      t.string :goal_name
      t.string :goal_type
      t.text :goal_description
      t.text :goal_achievment_tools
      t.text :success_chriteria
      t.integer :score
      t.boolean :resolved

      t.timestamps
    end
  end
end
