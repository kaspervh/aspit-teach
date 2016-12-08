class DiaryEntryUser < ApplicationRecord
  belongs_to :user
  belongs_to :diary_entry

  def mark_as_read
    update_attribute(:read, true)
  end

end
