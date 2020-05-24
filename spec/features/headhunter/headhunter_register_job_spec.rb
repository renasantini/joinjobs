require 'rails_helper'

feature 'Headhunter register job' do
  scenario 'successfully' do
    
    headhunter = headhunter_login
    visit root_path
    click_on 'Cadastrar nova vaga'
    fill_in 'Título', with: 'Desenvolvedor Ruby on Rails'
    fill_in 'Empresa', with: 'JoinJobs'
    fill_in 'Descrição', with: 'Atuação no desenvolvimento na evolução do sistema atual, novas demandas e sustentação dos sistemas existentes.'
    fill_in 'Habilidades desejadas', with: 'Ruby on Rails, Git e TDD'
    fill_in 'Faixa salarial', with: '4500'
    fill_in 'Nível de experiência', with: 'Júnior'
    fill_in 'Limite para candidatura', with: '19/06/2020'
    fill_in 'Região', with: 'Trabalho remoto'
    click_on 'Cadastrar'

    expect(page).to have_content('Desenvolvedor Ruby on Rails')
    expect(page).to have_content('Empresa: JoinJobs')
    expect(page).to have_content('Descrição: Atuação no desenvolvimento na evolução do sistema atual, novas demandas e sustentação dos sistemas existentes.')
    expect(page).to have_content('Habilidades desejadas: Ruby on Rails, Git e TDD')
    expect(page).to have_content('Faixa salarial: R$ 4.500,00')
    expect(page).to have_content('Nível de experiência: Júnior')
    expect(page).to have_content('Data limite para candidatura: 19/06/2020')
    expect(page).to have_content('Região: Trabalho remoto')
    expect(page).to have_content('Código da vaga:')
  end
end
