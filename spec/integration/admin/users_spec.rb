require "rails_helper"

RSpec.feature "admin can" do 
  before :each do 
    visit "/users/2"
    click_on "Brugere"
  end

  scenario "visit users path" do 
    expect(current_path).to eq users_path
    expect(page).to have_content "Elever" 
    expect(page).to have_content "Lærer" 
    expect(page).to have_content "Special pedagoger" 
    expect(page).to have_content "Administratore" 
    expect(page).to have_content "Brugernavn" 
    expect(page).to have_content "Email" 
    expect(page).to have_content "optioner" 
    expect(page).to have_content "Vis" 
    expect(page).to have_content "Rediger" 
    expect(page).to have_content "Slet"
    expect(page).to have_content "Ny bruger"
  end

  scenario "go to new user path" do 
    click_on "Ny bruger"
    expect(current_path).to eq new_user_path
    expect(page).to have_content "Ny bruger"
    expect(page).to have_content "Brugernavn:"
    expect(page).to have_content "Email:"
    expect(page).to have_content "Kodeord:"
    expect(page).to have_content "Rolle:"
    expect(page).to have_content "Skole:"
    expect(page).to have_content "Klasse:"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end

  scenario "make a new user" do
    click_on "Ny bruger"
    fill_in "user[username]", with: "birger"
    fill_in "user[email]", with: "birger@example.com"
    fill_in "user[password_digest]", with: "tvebakk1"
    select "Student", from: "user[role_id]"
    select "en skole", from: "user[school_id]"
    select "Ikke Tilknyttet klasse", from: "user[grade_id]"
    click_on "Gem"
    expect(current_path).to eq users_path
  end
end