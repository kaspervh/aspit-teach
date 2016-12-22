class MessageUser < ApplicationRecord
  belongs_to :user
  belongs_to :message

  def mark_as_read
    update_attribute(:read, true)
  end

end
