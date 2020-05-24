require 'rails_helper'

feature 'User view comments' do
  scenario 'succesfully' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    create(:application, job: job, user: user)
    create(:comment, headhunter: headhunter, profile: user.profile)
    

    visit root_path
    click_on 'Perfil'
    
    expect(page).to have_content('Comentários')
    expect(page).to have_content('Pergunta')
  end

  scenario 'and answer' do
    headhunter = create(:headhunter)
    job = create(:job, headhunter: headhunter)
    user = user_login
    user.profile = create(:profile)
    create(:application, job: job, user: user)
    create(:comment, headhunter: headhunter, profile: user.profile)
    

    visit root_path
    click_on 'Perfil'
    fill_in 'Responder',	with: 'Trabalhei como...' 
    click_on 'Enviar'

    expect(page).to have_content('Pergunta')
    expect(page).to have_content('Trabalhei como...')
  end

end