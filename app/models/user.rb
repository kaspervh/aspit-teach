class User < ApplicationRecord

  belongs_to :role
  belongs_to :school
  belongs_to :grade

  has_many :diary_entry_users
  has_many :diary_entries, through: :diary_entry_users

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

  def unread_diary_entries_count
    diary_entry_users.where(read: false).count        
  end

  def unread_diary_entries
    diary_entries.joins(:diary_entry_users).where(diary_entry_users: {read: false})
  end

  def read_diary_entries
    diary_entries.joins(:diary_entry_users).where(diary_entry_users: {read: true})
  end 

  
end
