require 'rails_helper'

feature 'User apply to a job' do
  scenario 'successfully' do
    job = create :job
    user = user_login
    visit root_path
    click_on 'Vagas'
    click_on 'Job1'
    click_on 'Se candidatar para a vaga'
    click_on 'Confirmar candidatura'

    expect(current_path).to eq user_applications_path
    expect(page).to have_content("Minhas vagas")
    expect(page).to have_content(job.title)
  end

    
  xscenario "can't apply to the same job" do
    
  end
end
