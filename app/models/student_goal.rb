class StudentGoal < ApplicationRecord
    has_many :readers, as: :readerble, dependent: :destroy
    has_many :users, through: :readers, source: :readerble, source_type: "User"
    has_many :student_goal_evaluations

  def create_student_goal_reader(current_user, student_id)
    if school = current_user.school
      personel_ids = school.readers(current_user)
      user_ids = personel_ids << student_id
      create_readers(user_ids)
    else 
      # TODO: create error handling 
    end
  end

  def create_readers(reader_ids)
    reader_ids.each do |reader_id|
      read = (reader_id)
      reader = Reader.new(
        user_id: reader_id, 
        readerble_id: id,
        readerble_type: self.class.name,
        read: read
      )
      if reader.save

      else
        # TODO: error handling
      end
    end
  end

  def goal_type_options
    {
      "Personlig udvikling".to_sym => "Personlig udvikling",
      "Faglig udvikling".to_sym    => "Faglig udvikling"
    }
  end

public
  def scores
    scores = []
    scores << self.score
    evaluation = self.student_goal_evaluations
    evaluation.each do |evaluation|
      scores << evaluation.intermediate_score
    end 
    return scores
  end

end
