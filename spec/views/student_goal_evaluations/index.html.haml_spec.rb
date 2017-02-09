require 'rails_helper'

RSpec.describe "student_goal_evaluations/index", type: :view do
  before(:each) do
    assign(:student_goal_evaluations, [
      StudentGoalEvaluation.create!(
        :student_goal_id => 2,
        :goal_evaluation => "MyText",
        :achivement_tools_evaluation => "MyText",
        :intermediate_score => 3
      ),
      StudentGoalEvaluation.create!(
        :student_goal_id => 2,
        :goal_evaluation => "MyText",
        :achivement_tools_evaluation => "MyText",
        :intermediate_score => 3
      )
    ])
  end

  it "renders a list of student_goal_evaluations" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
