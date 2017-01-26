require 'rails_helper'

RSpec.describe "student_goals/edit", type: :view do
  before(:each) do
    @student_goal = assign(:student_goal, StudentGoal.create!(
      :user_id => 1,
      :goal_name => "MyString",
      :main_goal => "MyText",
      :learning_goal => "MyText",
      :fufillment_tools => "MyText",
      :fufillment_criteria => "MyText",
      :beginning_score => 1,
      :resolved => false
    ))
  end

  it "renders the edit student_goal form" do
    render

    assert_select "form[action=?][method=?]", student_goal_path(@student_goal), "post" do

      assert_select "input#student_goal_user_id[name=?]", "student_goal[user_id]"

      assert_select "input#student_goal_goal_name[name=?]", "student_goal[goal_name]"

      assert_select "textarea#student_goal_main_goal[name=?]", "student_goal[main_goal]"

      assert_select "textarea#student_goal_learning_goal[name=?]", "student_goal[learning_goal]"

      assert_select "textarea#student_goal_fufillment_tools[name=?]", "student_goal[fufillment_tools]"

      assert_select "textarea#student_goal_fufillment_criteria[name=?]", "student_goal[fufillment_criteria]"

      assert_select "input#student_goal_beginning_score[name=?]", "student_goal[beginning_score]"

      assert_select "input#student_goal_resolved[name=?]", "student_goal[resolved]"
    end
  end
end
