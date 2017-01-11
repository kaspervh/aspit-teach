require "rails_helper"

RSpec.feature "super admin can" do 
  before :each do 
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[0].click
  end

  scenario "checks if the page is super admin page" do 
    expect(current_path).to eq root_path
    expect(page).to have_content "Skole"
    expect(page).to have_content "Skole klasser" 
  end
end