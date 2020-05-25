require 'rails_helper'

feature 'Headhunter mark candidates profile as favorite' do
  scenario 'successfully' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    user2 = create(:user)
    user2.profile = create(:profile, name: 'user2')
    create(:application, job: job, user: user1)
    create(:application, job: job, user: user2)
    

    visit root_path
    click_on 'Minhas vagas'
    click_on job.title
    click_on 'Candidatos'
    click_on 'user1'
    click_on 'Adicionar aos favoritos'
    fill_in 'Observações',	with: 'Bastante experiência na área' 
    click_on 'Confirmar'

    expect(current_path).to eq(headhunter_favorites_path)
    expect(page).to have_content('Candidatos destacados')
    expect(page).to have_content(user1.profile.name)
    expect(page).to have_content('Bastante experiência na área')
    expect(page).to_not have_content(user2.profile.name)
  end
  
  scenario ' and view all favorites profiles from root path' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    user2 = create(:user)
    user2.profile = create(:profile, name: 'user2')
    create(:favorite, headhunter: headhunter, profile: user1.profile)
    
    visit root_path
    click_on 'Candidatos destacados'
    
    expect(page).to have_content('Candidatos destacados')
    expect(page).to have_content(user1.profile.name)
    expect(page).to_not have_content(user2.profile.name)
  end
  
  scenario ' and remove a favorite profile' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    user2 = create(:user)
    user2.profile = create(:profile, name: 'user2')
    create(:favorite, headhunter: headhunter, profile: user1.profile)
    fav = create(:favorite, headhunter: headhunter, profile: user2.profile)
    
    visit root_path
    click_on 'Candidatos destacados'
    within("tr#fav-#{fav.id}") do
      click_on 'Remover dos destacados'
    end
    
    expect(page).to have_content('Candidatos destacados')
    expect(page).to have_content(user1.profile.name)
    expect(page).to_not have_content(user2.profile.name)
  end
end