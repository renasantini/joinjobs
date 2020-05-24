require 'rails_helper'

feature 'Headhunter reject and send feedback to candidate' do
  scenario 'successfully' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:application, job: job, user: user1)
    
    visit root_path
    click_on 'Minhas vagas'
    click_on job.title
    click_on 'Candidatos'
    click_on 'user1'
    click_on 'Rejeitar perfil'
    fill_in 'Feedback',	with: 'Obrigado pelo interesse, mas...' 
    click_on 'Enviar'
    
    expect(page).to have_content('Candidatos rejeitados')
    expect(page).to have_content('user1')
    expect(page).to have_content('Obrigado pelo interesse, mas...')
    expect(page).to have_content(job.title)
  end
end