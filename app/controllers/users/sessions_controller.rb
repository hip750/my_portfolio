class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to user_path(user.id), notice: 'ゲストユーザーとしてログインしました'
  end

  private

  # リダイレクト先を指定
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
end
