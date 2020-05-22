require 'rails_helper'

feature "headhunter authentication" do
  context ' sign up' do
    scenario "succesfully" do
      
      visit root_path
      click_on 'Inscrever-se como headhunter'
      fill_in "E-mail",	with: "headhunter@teste.com.br" 
      fill_in "Senha",	with: "12345678"
      fill_in "Confirmar senha",	with: "12345678"
      within 'form' do
        click_on 'Inscrever-se'
      end
      
      expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
      expect(page).not_to have_link('Log in')
      expect(page).to have_link('Sair') 
      expect(current_path).to eq(root_path)
    end
  
    scenario 'and must fill in all fields' do
      
      visit root_path
      click_on 'Inscrever-se como headhunter'
      fill_in "E-mail",	with: "" 
      fill_in "Senha",	with: ""
      fill_in "Confirmar senha",	with: ""
      within 'form' do
        click_on 'Inscrever-se'
      end

      expect(page).to have_content('E-mail não pode ficar em branco')
      expect(page).to have_content('Senha não pode ficar em branco')
      expect(page).to have_link('Entrar como headhunter')
      expect(page).not_to have_link('Sair')
    end
    
  end

  context ' log in' do
    scenario "succesfully" do
      headhunter = Headhunter.create!( email: 'headhunter@teste.com.br', password: '12345678')

      visit root_path
      click_on 'Entrar como headhunter'
      fill_in "E-mail",	with: "headhunter@teste.com.br" 
      fill_in "Senha",	with: "12345678"
      click_on 'Login'
    end
  end

  context 'log out' do
    scenario 'successfully' do
      headhunter = Headhunter.create!( email: 'headhunter@teste.com.br', password: '12345678')

      visit root_path
      click_on 'Entrar como headhunter'
      fill_in 'E-mail', with: headhunter.email
      fill_in 'Senha', with: headhunter.password
      click_on 'Login'
      click_on 'Sair'

      expect(page).to have_content('Logout efetuado com sucesso.')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end