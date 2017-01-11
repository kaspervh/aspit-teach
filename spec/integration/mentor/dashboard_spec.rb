require "rails_helper"

RSpec.feature "a mentor can" do
  before :each do
    visit root_path
    click_on "skift bruger"
    find_all(:link, "vælg")[3].click
  end

  scenario "visit dashboard" do
    expect(current_path).to eq root_path
    expect(page).to have_content "Elever"
    expect(page).to have_content "Ulæste dagbogs notater"
    expect(page).to have_content "Mine elever"
    expect(page).to have_content "Mine beskeder"
  end
end