class Grade < ApplicationRecord
	belongs_to :school
  has_many :users
  has_many :scheduels

  def students
    users.joins(:role).where(roles: {name: "Student"})
  end

  def message_users(current_user)
    teachers_and_mentors.ids
  end

  def mentors
    users.joins(:role).where(roles: {name: "Mentor"})
  end

  def teachers
    users.joins(:role).where(roles: {name: "Teacher"})
  end

  def teachers_and_mentors
    users.joins(:role).where(roles: {name: "Teacher", name: "Mentor"})
  end
end
