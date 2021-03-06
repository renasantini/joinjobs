require 'rails_helper'

feature 'User apply to a job' do
  scenario 'successfully' do
    job = create(:job, title: 'Job1')
    user = user_login
    user.profile = create(:profile)
    visit root_path
    click_on 'Ver vagas'
    click_on 'Job1'
    click_on 'Se candidatar para a vaga'
    click_on 'Confirmar candidatura'

    expect(current_path).to eq user_applications_path
    expect(page).to have_content("Minhas vagas")
    expect(page).to have_content(job.title)
  end
end
