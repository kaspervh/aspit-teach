class School < ApplicationRecord
	has_many :grades
  has_many :users

  def students
    users.joins(:role).where(roles: {name: "Student"})
  end

  def teachers
    users.joins(:role).where(roles: {name: "Teacher"})
  end

  def mentors
    users.joins(:role).where(roles: {name: "Mentor"})
  end

  def admins
    users.joins(:role).where(roles: {name: "Admin"})
  end

  def teachers_admins_mentors
    teachers + admins + mentors
  end

  def readers(current_user)
    ids = teachers.ids + admins.ids + mentors.ids
    return ids
  end
end
