require 'rails_helper'

RSpec.feature 'user sees a specific category' do
  scenario 'user sees a specific category' do
    category = Category.create(title:"Engineering")

    visit category_path(category)

    expect(page).to have_content("Engineering")
  end
end
