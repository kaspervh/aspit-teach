class Grade < ApplicationRecord
	belongs_to :school
  has_many :users

  def students
    users.joins(:role).where(roles: {name: "Student"})
  end
end
