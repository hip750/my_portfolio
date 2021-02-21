class Users::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create

  def check_guest
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to user_path(current_user), alert: 'ゲストユーザーの変更はできません。'
    end
  end
end
