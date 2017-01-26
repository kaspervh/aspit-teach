require 'rails_helper'

RSpec.describe "student_goals/show", type: :view do
  before(:each) do
    @student_goal = assign(:student_goal, StudentGoal.create!(
      :user_id => 2,
      :goal_name => "Goal Name",
      :main_goal => "MyText",
      :learning_goal => "MyText",
      :fufillment_tools => "MyText",
      :fufillment_criteria => "MyText",
      :beginning_score => 3,
      :resolved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Goal Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
