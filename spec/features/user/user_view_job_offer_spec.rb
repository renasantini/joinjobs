require 'rails_helper'

feature 'User receive job offer' do
  scenario 'successfully' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    job_offer = create(:job_offer, headhunter: headhunter, profile: user.profile,
                       start_date: '01/06/2020', wage: '15000')
    
    visit root_path
    click_on 'Propostas'
    click_on job_offer.title
   

    expect(page).to have_content('Proposta')
    expect(page).to have_content(job_offer.title)
    expect(page).to have_content(job_offer.role)
    expect(page).to have_content('R$ 15.000,00')
    expect(page).to have_content(job_offer.benefits)
    expect(page).to have_content(job_offer.expectations)
    expect(page).to have_content('01/06/2020')
    
  end
  
  scenario 'accept and reject others job offers' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    job_offer = create(:job_offer, headhunter: headhunter, profile: user.profile)
    
    visit root_path
    click_on 'Propostas'
    click_on job_offer.title
    click_on 'Responder proposta'
    select 'Aceitar', from: 'Aceitar proposta?'
    select 'Sim', from: 'Confirma a data de início?'
    fill_in 'Mensagem',	with: 'Topo! Topo! Porque não?'
    click_on 'Confirmar'

    expect(page).to have_content('Proposta aceita!')
  end
  
  scenario ' and reject' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    job_offer = create(:job_offer, headhunter: headhunter, profile: user.profile)
    
    visit root_path
    click_on 'Propostas'
    click_on job_offer.title
    click_on 'Responder proposta'
    select 'Recusar', from: 'Aceitar proposta?'
    fill_in 'Mensagem',	with: 'Não, obrigado'
    click_on 'Confirmar'

    expect(page).to have_content('Proposta recusada.')
  end
end