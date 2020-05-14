require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('JoinJobs')
    expect(page).to have_content('Bem vindo ao portal de empregos')
  end
end