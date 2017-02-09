require 'rails_helper'

RSpec.describe "module_evaluations/show", type: :view do
  before(:each) do
    @module_evaluation = assign(:module_evaluation, ModuleEvaluation.create!(
      :module_name => "Module Name",
      :module_score => 2,
      :evaluation_explanation => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Module Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
