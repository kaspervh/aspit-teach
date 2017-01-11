require "rails_helper"

RSpec.feature "admin can" do 
  before :each do 
    visit "/users/2"
    click_on "instruktioner"
    click_on "Nyt emne"
  end

  scenario "visit new subject path" do 
    expect(current_path).to eq new_subject_path
    expect(page).to have_content "Nyt emne"
    expect(page).to have_content "Emne navn:"
    expect(page).to have_content "Tilbage"
    expect(page).to have_button("Gem")
  end

  scenario "make a new subject" do 
    fill_in "subject[name]", with: "Ruby on rails"
    click_on "Gem"
    expect(current_path).to eq root_path
  end
end