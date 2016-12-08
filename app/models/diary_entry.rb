class DiaryEntry < ApplicationRecord
  has_many :diary_entry_users, dependent: :destroy
  has_many :users, through: :diary_entry_users
  has_many :comments, as: :commentable 

  def create_diary_entry_users(current_user)
    if grade = current_user.grade
      users = grade.diary_entry_users(current_user)
      create_readers(users, current_user)
    else 
      # TODO: create error handling 
    end
  end

  def author_name 
    if user = users.joins(:role).where(roles: {name: "Student"}).first
      return user.username
    end
    ""
  end

  def read?(current_user)
    if diary_entry_user = diary_entry_users.find_by(user_id: current_user.id)
     return diary_entry_user.read
    end
    false
  end

  private 

  def create_readers(readers, current_user)
    readers << current_user
    readers.each do |reader|
      read = (current_user == reader)
      diary_entry_user = DiaryEntryUser.new(
        user_id: reader.id, 
        diary_entry_id: id,
        read: read
      )
      if diary_entry_user.save

      else
        # TODO: error handling
      end
    end
  end
end
