class UnreadDiaryEntriesController < ApplicationController
  def index
    @diary_entries = DiaryEntry.all
  end
end
