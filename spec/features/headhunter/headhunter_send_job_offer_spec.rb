require 'rails_helper'

feature 'Headhunter send job offer to candidate' do
  scenario 'successfully' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:application, job: job, user: user1)
    fav = create(:favorite, headhunter: headhunter, profile: user1.profile)
        
    visit root_path
    click_on 'Candidatos destacados'
    within("tr#fav-#{fav.id}") do
      click_on 'Enviar proposta'
    end
    fill_in 'Mensagem',	with: 'Parabéns! Estamos enviando a proposta...'
    fill_in 'Cargo',	with: 'Aspone'
    fill_in 'Funções',	with: 'Assistende de po...'
    fill_in 'Salário',	with: '34999'
    fill_in 'Benefícios',	with: 'Auxílio paletó'
    fill_in 'Expectativas da empresa',	with: 'Rachadinha 30/70'
    fill_in 'Data prevista de início',	with: '15/10/2020'
    click_on 'Enviar'

    expect(page).to have_content('Enviada em:')
    expect(page).to have_content('user1')
    expect(page).to have_content('Parabéns! Estamos enviando a proposta...')
    expect(page).to have_content('Cargo: Aspone')
    expect(page).to have_content('Funções: Assistende de po...')
    expect(page).to have_content('Salário: R$ 34.999,00')
    expect(page).to have_content('Benefícios: Auxílio paletó')
    expect(page).to have_content('Expectativas da empresa: Rachadinha 30/70')
    expect(page).to have_content('Data prevista de início: 15/10/2020')
  end
end
