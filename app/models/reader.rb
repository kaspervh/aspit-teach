class Reader < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :student_goal
  has_many :users
  has_many :messages
  has_many :student_goals

  def mark_as_read
    update_attribute(:read, true)
  end

end
