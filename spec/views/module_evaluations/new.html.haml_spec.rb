require 'rails_helper'

RSpec.describe "module_evaluations/new", type: :view do
  before(:each) do
    assign(:module_evaluation, ModuleEvaluation.new(
      :module_name => "MyString",
      :module_score => 1,
      :evaluation_explanation => "MyText"
    ))
  end

  it "renders new module_evaluation form" do
    render

    assert_select "form[action=?][method=?]", module_evaluations_path, "post" do

      assert_select "input#module_evaluation_module_name[name=?]", "module_evaluation[module_name]"

      assert_select "input#module_evaluation_module_score[name=?]", "module_evaluation[module_score]"

      assert_select "textarea#module_evaluation_evaluation_explanation[name=?]", "module_evaluation[evaluation_explanation]"
    end
  end
end
