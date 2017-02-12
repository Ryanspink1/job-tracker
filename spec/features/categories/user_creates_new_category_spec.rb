require 'rails_helper'

RSpec.feature 'user creates new category' do
  scenario 'a user can create a new category' do

    visit new_category_path

    fill_in "category[title]", with: "Engineering"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")

    expect(page).to have_content("Engineering")
  end
end
