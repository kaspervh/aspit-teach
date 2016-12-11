class AddAttachmentImageToScheduels < ActiveRecord::Migration
  def self.up
    change_table :scheduels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :scheduels, :image
  end
end
