class CreateDiaryEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :diary_entries do |t|
      t.text :content

      t.timestamps
    end
  end
end
