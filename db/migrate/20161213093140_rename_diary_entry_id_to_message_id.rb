class RenameDiaryEntryIdToMessageId < ActiveRecord::Migration[5.0]
  def change
    rename_column :message_users, :diary_entry_id, :message_id
  end
end
