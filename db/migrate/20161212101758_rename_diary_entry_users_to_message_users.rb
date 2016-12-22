class RenameDiaryEntryUsersToMessageUsers < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :diary_entry_users, :message_users
  end

  def self.down
    rename_table :message_users, :diary_entry_users
  end
end
