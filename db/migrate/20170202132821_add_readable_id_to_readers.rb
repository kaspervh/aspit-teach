class AddReadableIdToReaders < ActiveRecord::Migration[5.0]
  def change
    add_column :readers, :readerble_id, :integer
    add_column :readers, :readerble_type, :string
    #remove_column :readers, :message_id
  end
end
