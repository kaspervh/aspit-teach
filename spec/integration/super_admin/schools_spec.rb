require "rails_helper"

RSpec.feature "super admin can" do 
  before :each do 
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[0].click
    click_on "Skole"
  end

  scenario "visit school path" do
    expect(page).to have_content "Navn" 
    expect(page).to have_content "Optioner"
    expect(page).to have_content "Ny skole" 
    expect(page).to have_content "Ny skole klasse"  
    expect(current_path).to eq schools_path
  end

  scenario "go to new school path" do 
    click_on "Ny skole"
    expect(current_path).to eq new_school_path
    expect(page).to have_content "Ny skole"
    expect(page).to have_content "Skole Navn"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end

  scenario "make a new school" do 
    click_on "Ny skole"
    fill_in "school[name]", with: "AspIT Østjylland"
    click_on "Gem"
    expect(page).to have_content "School was successfully created."
    expect(page).to have_content "AspIT Østjylland"
    expect(page).to have_content "Navn:"
    expect(page).to have_content "Rediger"
    expect(page).to have_content "Tilbage"
  end

  scenario "go to new grade path through schools path" do 
    click_on "Ny skole klasse"
    expect(current_path).to eq new_grade_path
  end
end