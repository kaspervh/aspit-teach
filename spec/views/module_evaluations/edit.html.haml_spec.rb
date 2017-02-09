require 'rails_helper'

RSpec.describe "module_evaluations/edit", type: :view do
  before(:each) do
    @module_evaluation = assign(:module_evaluation, ModuleEvaluation.create!(
      :module_name => "MyString",
      :module_score => 1,
      :evaluation_explanation => "MyText"
    ))
  end

  it "renders the edit module_evaluation form" do
    render

    assert_select "form[action=?][method=?]", module_evaluation_path(@module_evaluation), "post" do

      assert_select "input#module_evaluation_module_name[name=?]", "module_evaluation[module_name]"

      assert_select "input#module_evaluation_module_score[name=?]", "module_evaluation[module_score]"

      assert_select "textarea#module_evaluation_evaluation_explanation[name=?]", "module_evaluation[evaluation_explanation]"
    end
  end
end
