require 'rails_helper'


RSpec.feature 'User sees all categories' do
  scenario 'a user sees all the categories' do
    category_one = Category.create(title:"Engineering")
    category_two = Category.create(title:"Marketing")

    visit(categories_path)

    within("h1") do
      expect(page).to have_content("All Categories")
    end

    within(".category_index_list .category:nth-child(1)") do
      expect(page).to have_content("Engineering")
    end

    within(".category_index_list .category:nth-child(2)") do
      expect(page).to have_content("Marketing")
    end
  end
end
