class MessageUser < ApplicationRecord
  belongs_to :user
  belongs_to :message
  has_many :users
  has_many :messages

  def mark_as_read
    update_attribute(:read, true)
  end

end
