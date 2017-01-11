require "rails_helper"

RSpec.feature "teacher can" do 
  before :each do 
    visit root_path 
    click_on "skift bruger"
    find_all(:link, "vælg")[2].click
    click_on "Elever"
  end

  scenario "visit students page" do 
    expect(current_path).to eq users_path
    expect(page).to have_content "Brugernavn"
    expect(page).to have_content "Email"
    expect(page).to have_content "Optioner"
    expect(page).to_not have_content "Ny bruger"
  end
end