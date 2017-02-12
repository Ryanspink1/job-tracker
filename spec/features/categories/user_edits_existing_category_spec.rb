require 'rails_helper'

RSpec.feature 'user edits existing category' do
  scenario 'user can edit existing category' do
    category = Category.create(title:"HR")

    visit categories_path

    within('.category_index_list .category:nth-child(1)') do
      click_link "Edit"
    end

    expect(current_path).to eq(edit_category_path(category))

    fill_in "category[title]", with: "Managerial"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Managerial")
  end
end
