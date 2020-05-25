require 'rails_helper'

feature 'User search jobs' do
  scenario 'successfully' do
    create :job, title: 'Desenvolvedor Backend'
    create :job, title: 'Desenvolvedor Ruby on Rails'
    user = user_login
    user.profile = create :profile
    visit root_path
    click_on 'Ver vagas'
    fill_in 'Pesquisa', with: 'Desenvolvedor'
    click_on 'Pesquisar'
    
    expect(current_path).to eq search_user_jobs_path 
    expect(page).to have_content('Desenvolvedor Backend')
    expect(page).to have_content('Desenvolvedor Ruby on Rails')
  end

  scenario 'find only one match' do
    create :job, title: 'Desenvolvedor Backend'
    create :job, title: 'Desenvolvedor Ruby on Rails'
    user = user_login
    user.profile = create :profile
    visit root_path
    click_on 'Ver vagas'
    fill_in 'Pesquisa', with: 'Rails'
    click_on 'Pesquisar'
    
    expect(current_path).to eq search_user_jobs_path
    expect(page).to have_content('Desenvolvedor Ruby on Rails')
    expect(page).not_to have_content('Desenvolvedor Backend')
  end
end