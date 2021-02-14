class SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to user_path(user.id), notice: 'ゲストユーザーとしてログインしました。'
  end
end
