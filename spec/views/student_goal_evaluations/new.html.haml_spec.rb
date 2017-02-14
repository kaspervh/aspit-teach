require 'rails_helper'

RSpec.describe "student_goal_evaluations/new", type: :view do
  before(:each) do
    assign(:student_goal_evaluation, StudentGoalEvaluation.new(
      :student_goal_id => 1,
      :goal_evaluation => "MyText",
      :achivement_tools_evaluation => "MyText",
      :intermediate_score => 1
    ))
  end

  it "renders new student_goal_evaluation form" do
    render

    assert_select "form[action=?][method=?]", student_goal_evaluations_path, "post" do

      assert_select "input#student_goal_evaluation_student_goal_id[name=?]", "student_goal_evaluation[student_goal_id]"

      assert_select "textarea#student_goal_evaluation_goal_evaluation[name=?]", "student_goal_evaluation[goal_evaluation]"

      assert_select "textarea#student_goal_evaluation_achivement_tools_evaluation[name=?]", "student_goal_evaluation[achivement_tools_evaluation]"

      assert_select "input#student_goal_evaluation_intermediate_score[name=?]", "student_goal_evaluation[intermediate_score]"
    end
  end
end
