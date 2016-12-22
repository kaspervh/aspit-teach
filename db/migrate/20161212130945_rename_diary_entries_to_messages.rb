class RenameDiaryEntriesToMessages < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :diary_entries, :messages
  end

  def self.down
    rename_table :messages, :diary_entries
  end
end
