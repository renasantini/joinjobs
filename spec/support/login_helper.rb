module LoginHelper
  def user_login(user = create(:user))
    login_as user, scope: :user
    user
  end

  def headhunter_login(headhunter = create(:headhunter))
    login_as headhunter, scope: :headhunter
    headhunter
  end
end