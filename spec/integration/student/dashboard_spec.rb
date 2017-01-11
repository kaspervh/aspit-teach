require "rails_helper"

RSpec.feature "student can"  do 
  before :each do 
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[4].click
    visit root_path
  end

  scenario "visit dashboard path" do
    expect(current_path).to eq root_path
    expect(page).to have_content "Ugeskema"
    expect(page).to have_content "Mine dagbogsnotater"
    expect(page).to have_content "Mine Målsætninger"
    expect(page).to have_content "Mine beskeder"
    expect(page).to have_content "How to"
    expect(page).to have_content "Nyt dagbogsnotat"
  end
end