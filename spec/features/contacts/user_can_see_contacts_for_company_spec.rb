require 'rails_helper'

RSpec.feature 'user can create and see contacts' do
  scenario 'user can see contacts created for specific company' do
    company = Company.create(name: "ESPN")
    company.contacts.create(name:"Alabaster", position: "Lead Dev", email: "Abalone@hotmail.com")
    company.contacts.create(name:"Jeravicious", position: "Boss", email: "Jeronimo@hotmail.com")

    visit company_path(company)

    expect(page).to have_content ("Alabaster")
    expect(page).to have_content ("Lead Dev")
    expect(page).to have_content ("Abalone@hotmail.com")
    expect(page).to have_content ("Jeravicious")
    expect(page).to have_content ("Boss")
    expect(page).to have_content ("Jeronimo@hotmail.com")

  end
end
