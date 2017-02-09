require 'rails_helper'

RSpec.describe "module_evaluations/index", type: :view do
  before(:each) do
    assign(:module_evaluations, [
      ModuleEvaluation.create!(
        :module_name => "Module Name",
        :module_score => 2,
        :evaluation_explanation => "MyText"
      ),
      ModuleEvaluation.create!(
        :module_name => "Module Name",
        :module_score => 2,
        :evaluation_explanation => "MyText"
      )
    ])
  end

  it "renders a list of module_evaluations" do
    render
    assert_select "tr>td", :text => "Module Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
