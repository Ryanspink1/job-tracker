require 'rails_helper'

RSpec.feature 'user can create a new comment' do
  scenario 'user can create a new comment for a job' do
    company = Company.create(name:"ESPN")
    job = company.jobs.create(title:"Writer", level_of_interest:14,
      description:"chawesome", city:"Aberdeen",
      category:Category.create(title:"Production"))

    visit company_job_path(company, job)

    within('.comments') do
      fill_in "comment[author_name]", with: "Jebbadiah"
      fill_in "comment[body]", with: "Horses like Alabaster don't belong here"
      click_button "Submit"
    end


    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")


    within(".comments") do
      expect(page).to have_content("Horses like Alabaster don't belong here")
    end
  end
end
