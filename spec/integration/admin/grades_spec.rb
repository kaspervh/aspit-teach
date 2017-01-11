require "rails_helper"

RSpec.feature "super admin can" do 
  before :each do 
    visit "/users/2"
    click_on "Skole klasser"
  end

  scenario "go to grades path" do 
    expect(current_path).to eq grades_path
    expect(page).to have_content "Navn"
    expect(page).to have_content "Skole id"
    expect(page).to have_content "Optioner"
    expect(page).to have_content "Ny skole klasse"
  end

  scenario "go to new grade path" do 
    click_on "Ny skole klasse"
    expect(current_path).to eq new_grade_path
    expect(page).to have_content "Ny klasse"
    expect(page).to have_content "Klasse navn"
    expect(page).to have_content "Skole"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end

  scenario "make new grade" do 
    click_on "Ny skole klasse"
    fill_in "grade[name]", with: "11A"
    select "en skole", from: "grade[school_id]"
    click_on "Gem"
    expect(page).to have_content "Grade was successfully created."
    expect(page).to have_content "11A"
    expect(page).to have_content "Navn:"
    expect(page).to have_content "Skole"
    expect(page).to have_content "Rediger"
    expect(page).to have_content "Skoleklasser"
  end
end

