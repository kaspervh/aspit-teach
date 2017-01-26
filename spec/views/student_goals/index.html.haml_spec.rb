require 'rails_helper'

RSpec.describe "student_goals/index", type: :view do
  before(:each) do
    assign(:student_goals, [
      StudentGoal.create!(
        :user_id => 2,
        :goal_name => "Goal Name",
        :main_goal => "MyText",
        :learning_goal => "MyText",
        :fufillment_tools => "MyText",
        :fufillment_criteria => "MyText",
        :beginning_score => 3,
        :resolved => false
      ),
      StudentGoal.create!(
        :user_id => 2,
        :goal_name => "Goal Name",
        :main_goal => "MyText",
        :learning_goal => "MyText",
        :fufillment_tools => "MyText",
        :fufillment_criteria => "MyText",
        :beginning_score => 3,
        :resolved => false
      )
    ])
  end

  it "renders a list of student_goals" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Goal Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
