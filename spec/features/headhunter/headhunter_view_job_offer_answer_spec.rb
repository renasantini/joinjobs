require 'rails_helper'

feature 'Headhunter view job offer feedback' do
  scenario 'successfully' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:job_offer, headhunter: headhunter, profile: user1.profile, 
            status: 'accepted', answer_message: 'Aceito', title: 'Aspone', 
            confirm_start: 1)
            
    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Aspone'
    
    expect(page).to have_content('Proposta aceita!')
    expect(page).to have_content('O candidato confirmou a data de início.')
    expect(page).to have_content('Aceito')
  end

  scenario 'waiting feedback' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:job_offer, headhunter: headhunter, profile: user1.profile, 
            status: 'sent', answer_message: 'Aceito', title: 'Aspone')
            
    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Aspone'
    
    expect(page).to have_content('Aguardando resposta.')
  end

  scenario 'and start date unconfirmed' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:job_offer, headhunter: headhunter, profile: user1.profile, 
            status: 'accepted', answer_message: 'Aceito, mas não posso começar 
            nessa data', title: 'Aspone', confirm_start: 0)
            
    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Aspone'
    
    expect(page).to have_content('Proposta aceita!')
    expect(page).to have_content('O candidato não pode iniciar na data prevista.')
    expect(page).to have_content('Aceito, mas não posso começar nessa data')
  end

  scenario 'and job offer rejected' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:job_offer, headhunter: headhunter, profile: user1.profile, 
            status: 'rejected', answer_message: 'Não, obrigado!', 
            title: 'Aspone')
            
    visit root_path
    click_on 'Propostas enviadas'
    click_on 'Aspone'
    
    expect(page).to have_content('Proposta recusada.')
    expect(page).to have_content('Não, obrigado!')
  end
end
