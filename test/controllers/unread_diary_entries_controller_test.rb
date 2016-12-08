require 'test_helper'

class UnreadDiaryEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unread_diary_entries_index_url
    assert_response :success
  end

end
