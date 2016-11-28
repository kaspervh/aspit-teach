class CreateInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :instructions do |t|
      t.integer :subject_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
