class CreateModuleEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :module_evaluations do |t|
      t.string :module_name
      t.integer :module_score
      t.text :evaluation_explanation

      t.timestamps
    end
  end
end
