require 'rails_helper'

RSpec.describe "student_goals/new", type: :view do
  before(:each) do
    assign(:student_goal, StudentGoal.new(
      :user_id => 1,
      :goal_name => "MyString",
      :goal_type => "MyString",
      :goal_description => "MyText",
      :goal_achievment_tools => "MyText",
      :success_chriteria => "MyText",
      :score => 1,
      :resolved => false
    ))
  end

  it "renders new student_goal form" do
    render

    assert_select "form[action=?][method=?]", student_goals_path, "post" do

      assert_select "input#student_goal_user_id[name=?]", "student_goal[user_id]"

      assert_select "input#student_goal_goal_name[name=?]", "student_goal[goal_name]"

      assert_select "input#student_goal_goal_type[name=?]", "student_goal[goal_type]"

      assert_select "textarea#student_goal_goal_description[name=?]", "student_goal[goal_description]"

      assert_select "textarea#student_goal_goal_achievment_tools[name=?]", "student_goal[goal_achievment_tools]"

      assert_select "textarea#student_goal_success_chriteria[name=?]", "student_goal[success_chriteria]"

      assert_select "input#student_goal_score[name=?]", "student_goal[score]"

      assert_select "input#student_goal_resolved[name=?]", "student_goal[resolved]"
    end
  end
end
