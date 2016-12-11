class CreateScheduels < ActiveRecord::Migration[5.0]
  def change
    create_table :scheduels do |t|
      t.integer :grade_id

      t.timestamps
    end
  end
end
