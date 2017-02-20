class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :school
  belongs_to :grade

  has_many :readers
  has_many :messages, through: :readers, source: :readerble, source_type: "Message"
  has_many :student_goals, through: :readers, source: :readerble, source_type: "StudentGoal"

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

  def diary_entries
    messages.where(message_type: "diary_entry")
  end

  def unread_messages_count
    unread_messages.count
  end

  def unread_student_goals_count
    unread_student_goals.count
  end

  def unread_diary_entries
    messages.where(message_type: "diary_entry").includes(:readers).where(readers: {read: false})
  end

  def unread_messages
    messages.where(message_type: "message").includes(:readers).where(readers: {read: false})
  end 

  def unread_student_goals
    student_goals.includes(:readers).where(readers: {read: false})
  end

end
