class CreateDiaryEntryUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :diary_entry_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :diary_entry, index: true
      t.boolean :read

      t.timestamps
    end
  end
end
