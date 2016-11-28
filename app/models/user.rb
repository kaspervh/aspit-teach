class User < ApplicationRecord

  belongs_to :role
  belongs_to :school
  belongs_to :grade

  def super_admin?
    role.name == "Super admin"
  end

  def admin?
    role.name == "Admin"
  end

  def mentor?
    role.name == "Mentor"
  end

  def teacher? 
    role.name == "Teacher"
  end

  def student?
    role.name == "Student"
  end

end
