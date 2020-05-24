require 'rails_helper'

feature 'User view feedback' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    create(:application, job: job, user: user)
    create(:feedback, headhunter: headhunter, profile: user.profile, job: job)
    
    visit root_path
    click_on 'Propostas e feedbacks'
    
        
    expect(page).to have_content('Feedbacks')
    expect(page).to have_content('Obrigado, mas...')
    expect(page).to have_content(job.title)
  end
end
