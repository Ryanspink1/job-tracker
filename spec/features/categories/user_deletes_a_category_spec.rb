require 'rails_helper'

RSpec.feature 'user deletes existing category' do
  scenario 'user can delete a category' do
    category = Category.create(title:"HR")

    visit categories_path

    within(".category_index_list .category:nth-child(1)") do
      click_link "Delete"
    end

    expect(page).to have_content("HR was successfully deleted!")
  end
end
