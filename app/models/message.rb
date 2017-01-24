class Message < ApplicationRecord
  #include Bootsy::Container

  has_many :readers, dependent: :destroy
  has_many :users, through: :readers
  has_many :comments, as: :commentable 

  def create_diary_entry_users(current_user)
    if grade = current_user.grade
      teacher_id = grade.readers(current_user)
      #mentor_id = School.message_users(current_user)
      user_ids = teacher_id #+ mentor_id
      create_readers(current_user, user_ids)
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
   if reader = readers.find_by(user_id: current_user.id)
     return reader.read
    end
    false
  end

  def create_readers(current_user, reader_ids)
    reader_ids << current_user.id
    reader_ids.each do |reader_id|
      read = (current_user.id == reader_id)
      reader = Reader.new(
        user_id: reader_id, 
        message_id: id,
        read: read
      )
      if reader.save

      else
        # TODO: error handling
      end
    end
  end
end
