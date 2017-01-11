require "rails_helper"

RSpec.feature "student can" do 
  before :each do
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[4].click
    click_on "Nyt dagbogsnotat"
  end

  scenario "visit new diary entry path" do 
    expect(page).to have_content "Nyt dagbogsnotat" 
    expect(page).to have_content "Indhold" 
    expect(page).to have_button "Gem" 
    expect(page).to have_content "Tilbage"
  end
end 