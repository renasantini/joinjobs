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
  
  xscenario ' and accept and reject others job offers' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    job_offer = create(:job_offer, headhunter: headhunter, profile: user.profile)
    
    visit root_path
    click_on 'Propostas'
    click_on job_offer.title
    fill_in 'Mensagem',	with: 'Topo! Topo! Porque não?'
    check 'Sim'
    click_on 'Enviar'
  end
  
  xscenario ' and reject' do
    
  end
end