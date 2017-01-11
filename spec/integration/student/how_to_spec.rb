require "rails_helper"

RSpec.feature "student can" do 
  before :each do
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[4].click
    click_on "How to"
  end

  scenario "visit how to " do 
    expect(current_path).to eq how_to_index_path
    expect(page).to have_content "Fra begynder til job start her"
    expect(page).to have_content "KOP"
  end

  scenario "visit instructions path" do
    click_on "KOP"
    expect(current_url).to eq "http://www.example.com/subjects/1"
  end
end
