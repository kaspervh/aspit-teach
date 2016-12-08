class Grade < ApplicationRecord
	belongs_to :school
  has_many :users

  def students
    users.joins(:role).where(roles: {name: "Student"})
  end

  def diary_entry_users(current_user)
    mentors + teachers
  end

  def mentors
    users.joins(:role).where(roles: {name: "Mentor"})
  end

  def teachers
    users.joins(:role).where(roles: {name: "Teacher"})
  end
end
