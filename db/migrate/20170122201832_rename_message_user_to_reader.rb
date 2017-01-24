class RenameMessageUserToReader < ActiveRecord::Migration[5.0]
  def change
  	rename_table :message_users, :readers
  end
end
