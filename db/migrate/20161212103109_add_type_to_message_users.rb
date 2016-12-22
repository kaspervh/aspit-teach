class AddTypeToMessageUsers < ActiveRecord::Migration[5.0]
  def change
     add_column :message_users, :type, :string
  end
end
