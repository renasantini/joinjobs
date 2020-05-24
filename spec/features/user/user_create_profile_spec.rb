require 'rails_helper'

feature 'User create profile' do
  scenario 'successfully' do
    
    user = user_login
    visit root_path
    click_on 'Perfil'
    fill_in 'Nome completo', with: 'Sócrates Brasileiro Sampaio de Souza Vieira de Oliveira'
    fill_in 'Como você quer ser chamado?', with: 'Doutor Sócrates'
    fill_in 'CPF', with: '195.889.600-45'
    fill_in 'Data de nascimento', with: '19/02/1954'
    fill_in 'Formação', with: 'Medicina'
    fill_in 'Instituição de ensino', with: 'Faculdade de Medicina de Ribeirão Preto - USP'
    fill_in 'Resumo', with: 'Doutor dentro e fora de campo, Sócrates foi o mentor da Democracia Corinthiana e definitivamente um dos maiores jogadores da história do Corinthians. \n Jogador de muita técnica, muita classe e de uma inteligência incomparável, Sócrates é um dos maiores jogadores da história do futebol mundial.'
    fill_in 'Experiência', with: 'No Botafogo Futebol Clube, de Ribeirão Preto, foi considerado um fenômeno desde o início, pois quase não treinava em função de frequentar o curso de medicina na Faculdade de Medicina de Ribeirão Preto (USP). Em 1978 deixou o Botafogo e transferiu-se para o Corinthians.\nSócrates se firmaria no Corinthians em 1978, refazendo a dupla com seu ex-companheiro no Botafogo Geraldão. Mas seus grandes companheiros de ataque nesse time seriam Palhinha e Casagrande. Sócrates passou a se dedicar mais ao futebol depois que se formou em medicina (1977). Na Seleção Brasileira estrearia em 1979, em um amistoso contra o Paraguai.\nFoi uma das estrelas de times famosos em nível nacional e mundial: a Seleção Brasileira da Copa do Mundo FIFA de 1982 e do Corinthians da década de 1980, celebrado pelo movimento da Democracia Corintiana. Na Copa de 1982 marcou dois gols contra as respeitadas equipes da URSS e Itália, mas isso não bastou para o Brasil se sagrar campeão. Também teve excelente atuação na Copa América de 1983, onde a Seleção Brasileira foi vice-campeã. Aos 30 anos fez uma rápida e decepcionante passagem pela Fiorentina, da Itália, entre 1984 e 1985.'
    page.attach_file('Foto do perfil', './spec/fixtures/socrates.jpg')
    page.attach_file('Currículo', './spec/fixtures/socrates.pdf')
    click_on 'Salvar'

    expect(page).to have_content('Doutor Sócrates')
    expect(page).to have_content('Nome completo: Sócrates Brasileiro Sampaio de Souza Vieira de Oliveira')
    expect(page).to have_content('CPF: 195.889.600-45')
    expect(page).to have_content('Data de nascimento: 19/02/1954')
    expect(page).to have_content('Formação: Medicina')
    expect(page).to have_content('Instituição de ensino: Faculdade de Medicina de Ribeirão Preto - USP')
    expect(page).to have_content('Resumo: Doutor dentro e fora de campo, Sócrates foi o mentor da Democracia Corinthiana e definitivamente um dos maiores jogadores da história do Corinthians. \n Jogador de muita técnica, muita classe e de uma inteligência incomparável, Sócrates é um dos maiores jogadores da história do futebol mundial.')
    expect(page).to have_content('Experiência: No Botafogo Futebol Clube, de Ribeirão Preto, foi considerado um fenômeno desde o início, pois quase não treinava em função de frequentar o curso de medicina na Faculdade de Medicina de Ribeirão Preto (USP). Em 1978 deixou o Botafogo e transferiu-se para o Corinthians.\nSócrates se firmaria no Corinthians em 1978, refazendo a dupla com seu ex-companheiro no Botafogo Geraldão. Mas seus grandes companheiros de ataque nesse time seriam Palhinha e Casagrande. Sócrates passou a se dedicar mais ao futebol depois que se formou em medicina (1977). Na Seleção Brasileira estrearia em 1979, em um amistoso contra o Paraguai.\nFoi uma das estrelas de times famosos em nível nacional e mundial: a Seleção Brasileira da Copa do Mundo FIFA de 1982 e do Corinthians da década de 1980, celebrado pelo movimento da Democracia Corintiana. Na Copa de 1982 marcou dois gols contra as respeitadas equipes da URSS e Itália, mas isso não bastou para o Brasil se sagrar campeão. Também teve excelente atuação na Copa América de 1983, onde a Seleção Brasileira foi vice-campeã. Aos 30 anos fez uma rápida e decepcionante passagem pela Fiorentina, da Itália, entre 1984 e 1985.')
    expect(page).to have_css('img[src*="socrates.jpg"]')
  end
end
