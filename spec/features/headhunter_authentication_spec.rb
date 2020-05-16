require 'rails_helper'

feature "headhunter authentication" do
  context ' sign up' do
    scenario "succesfully" do
      
      visit root_path
      click_on 'Cadastre-se como headhunter'
      fill_in "E-mail",	with: "teste@teste.com.br" 
      fill_in "Senha",	with: "12345678"
      fill_in "Confirme sua senha",	with: "12345678"
      click_on 'Sign up'
      
      expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
      expect(page).not_to have_link('Log in')
      expect(page).to have_link('Sair') 
      expect(current_path).to eq(root_path)
    end
  
    scenario 'and must fill in all fields' do
      
      visit root_path
      click_on 'Cadastre-se como headhunter'
      fill_in "E-mail",	with: "" 
      fill_in "Senha",	with: ""
      fill_in "Confirme sua senha",	with: ""
      click_on 'Sign up'

      expect(page).to have_content('E-mail não pode ficar em branco')
      expect(page).to have_content('Senha não pode ficar em branco')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
    end
    
  end

  context ' log in' do
    scenario "succesfully" do
      headhunter = Headhunter.create!( email: 'teste@teste.com.br', password: '12345678')

      visit root_path
      click_on 'Entrar'
      fill_in "E-mail",	with: "teste@teste.com.br" 
      fill_in "Senha",	with: "12345678"
      click_on 'Log in'
    end
  end

  context 'log out' do
    scenario 'successfully' do
      headhunter = Headhunter.create!( email: 'teste@teste.com.br', password: '12345678')

      visit root_path
      click_on 'Entrar'
      fill_in 'E-mail', with: headhunter.email
      fill_in 'Senha', with: headhunter.password
      click_on 'Log in'
      click_on 'Sair'

      expect(page).to have_content('Logout efetuado com sucesso.')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end