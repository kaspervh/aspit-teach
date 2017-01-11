require "rails_helper"

RSpec.feature "admin can" do 
  before :each do 
    visit root_path 
    click_on "skift bruger"
    find_all(:link, "vælg")[1].click
  end

  scenario "visit root path" do 
    expect(current_path).to eq root_path
    expect(page).to have_content "Mit ugeskema"
    expect(page).to have_content "Mine elever"
    expect(page).to have_content "Mine beskeder"
    expect(page).to have_content "Nyt ugeskema"
    expect(page).to have_content "Instruktioner"
    expect(page).to have_content "Skole klasser"
    expect(page).to have_content "Brugere"
  end
end
