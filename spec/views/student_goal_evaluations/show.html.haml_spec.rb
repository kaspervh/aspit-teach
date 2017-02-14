require 'rails_helper'

RSpec.describe "student_goal_evaluations/show", type: :view do
  before(:each) do
    @student_goal_evaluation = assign(:student_goal_evaluation, StudentGoalEvaluation.create!(
      :student_goal_id => 2,
      :goal_evaluation => "MyText",
      :achivement_tools_evaluation => "MyText",
      :intermediate_score => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
  end
end
