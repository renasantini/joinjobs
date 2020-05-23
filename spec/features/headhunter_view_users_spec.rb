require 'rails_helper'

feature 'Headhunter view users' do
  scenario 'who apllied for a job' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: user1)
    user2 = create(:user)
    user2.profile = create(:profile, name: user2)
    user3 = create(:user)
    user3.profile = create(:profile, name: user3)
    create(:application, job: job, user: user1)
    create(:application, job: job, user: user2)
    

    visit root_path
    click_on 'Minhas vagas'
    click_on job.title
    click_on 'Candidatos'

    expect(page).to have_content(job.title)
    expect(page).to have_content('Candidatos')
    expect(page).to have_content(user1.profile.name)
    expect(page).to have_content(user2.profile.name)
    expect(page).to_not have_content(user3.profile.name)

  end

  

  xscenario 'and view candidate profiles' do
  end

 
end