require "rails helper"

Rspec.feature "admin can" do 
  before :each do 
    visit root_path
    click_on "skift bruger"
    find_all("vælg")[1].click
    click_on "Ny besked"
  end 

  scenario "visit new messages path" do 
    expect(page).to have_content "Ny besked"
    expect(page).to have_content "Besked tekst"
    expect(page).to have_content "Elever"
    expect(page).to have_content "fagligt personale"
    expect(current_path).eq new_user_message_path
  end

  