class User < ApplicationRecord

  belongs_to :role
  belongs_to :school
  belongs_to :grade

  has_many :readers
  has_many :messages, through: :readers
  has_many :student_goals, through: :readers

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
    unread_diary_entries.count        
  end

  def unread_messages_count
    unread_messages.count
  end

  def unread_diary_entries
    messages.where(message_type: "diary_entry").joins(:readers).where(readers: {read: false})
  end

  def read_diary_entries
    messages.joins(:readers).where(readers: {read: true})
  end

  def unread_messages
    messages.where(message_type: "message").joins(:readers).where(readers: {read: false})
  end 

  def read_messages
    messages.joins(:readers).where(readers: {read: true})
  end

end
