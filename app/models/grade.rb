class Grade < ApplicationRecord
	belongs_to :school
  has_many :users
  has_many :scheduels

  def students
    users.joins(:role).where(roles: {name: "Student"})
  end

  def mentors
    users.joins(:role).where(roles: {name: "Mentor"})
  end

  def admins 
    users.joins(:role).where(roles: {name: "Admin"})
  end

  def teachers
    users.joins(:role).where(roles: {name: "Teacher"})
  end

  def readers(current_user)
    ids = teachers.ids + admins.ids + mentors.ids
    return ids
  end

end
