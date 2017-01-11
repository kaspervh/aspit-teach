require "rails_helper"

RSpec.feature "teacher can" do 
  before :each do 
    visit root_path 
    click_on "skift bruger"
    find_all(:link, "vælg")[2].click
    find_all(:link, "Nyt ugeskema").first.click
  end

  scenario "visit new_scheduel_path" do 
    expect(page).to have_content "Nyt ugeskema"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end
end