class CheckUserRoles

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
end