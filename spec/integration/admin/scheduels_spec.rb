require "rails_helper"

RSpec.feature "admin can" do 
  before :each do 
    visit "/users/2"
    visit root_path
    find_all(:link, "Nyt ugeskema").first.click
  end

  scenario "visit new_scheduel_path" do 
    expect(page).to have_content "Nyt ugeskema"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end
end