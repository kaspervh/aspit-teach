require "rails_helper"

RSpec.feature "teacher can" do 
  before :each do 
    visit root_path 
    click_on "skift bruger"
    find_all(:link, "vælg")[2].click
    click_on "Instruktioner"
    click_on "Nyt emne"
  end
  
  scenario "go to instructions path" do 
    visit instructions_path
    expect(current_path).to eq instructions_path
    expect(page).to have_content "Instruktioner"
    expect(page).to have_content "Navn"
    expect(page).to have_content "Optioner"
    expect(page).to have_content "Ny instruktion"
  end

  scenario "go to new_instruction_path from root" do 
    click_on "Ny instruktion"
    expect(current_path).to eq new_instruction_path
    expect(page).to have_content "Ny instruktion"
    expect(page).to have_content "Emne:"
    expect(page).to have_content "Instruktions navn:"
    expect(page).to have_content "Indhold:"
    expect(page).to have_button("Gem")
    expect(page).to have_content "Tilbage"
  end

  scenario "make new instruction" do 
    visit new_instruction_path
    ap current_path
    select "Kop", from: "instruction[subject_id]"
    fill_in "instruction[name]", with: "Læs mein kampf"
    click_on "Gem"
    expect(current_path).to eq root_path
  end 
end