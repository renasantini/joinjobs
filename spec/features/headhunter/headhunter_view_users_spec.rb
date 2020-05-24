require 'rails_helper'

feature 'Headhunter view users' do
  scenario 'who apllied for a job' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    user2 = create(:user)
    user2.profile = create(:profile, name: 'user2')
    user3 = create(:user)
    user3.profile = create(:profile, name: 'user3')
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

  scenario 'and view candidate profile' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1', graduation: 'Engenheiro', 
                            birth_date: '12/08/1990', university: 'USP')
    create(:application, job: job, user: user1)
    
    visit root_path
    click_on 'Minhas vagas'
    click_on job.title
    click_on 'Candidatos'
    click_on 'user1'
        
    expect(page).to have_content('user1')
    expect(page).to have_content('Engenheiro')
    expect(page).to have_content('12/08/1990')
    expect(page).to have_content('USP')
  end

  scenario 'and comment on candidate profile' do
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
    fill_in 'Comentários',	with: 'Gostaria de saber mais sobre a sua experiência na empresa x' 
    click_on 'Enviar'

    expect(page).to have_content('user1')
    expect(page).to have_content('Gostaria de saber mais sobre a sua experiência na empresa x')
  end

  scenario 'and view answers' do
    headhunter = headhunter_login
    job = create(:job, headhunter: headhunter)
    user1 = create(:user)
    user1.profile = create(:profile, name: 'user1')
    create(:application, job: job, user: user1)
    comment = create(:comment, headhunter: headhunter, profile: user1.profile)
    create(:answer, user: user1, comment: comment)
    
    visit root_path
    click_on 'Minhas vagas'
    click_on job.title
    click_on 'Candidatos'
    click_on 'user1'
    
    expect(page).to have_content('user1')
    expect(page).to have_content('Pergunta')
    expect(page).to have_content('Resposta')
  end
end