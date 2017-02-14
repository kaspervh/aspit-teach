class Reader < ApplicationRecord
  belongs_to :user
  #belongs_to :message
  #belongs_to :student_goal
  belongs_to :readerble, polymorphic: true
  

  def mark_as_read
    update_attribute(:read, true)
  end

end
