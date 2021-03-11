class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_guest, only: :destroy

  private

  # リダイレクト先を指定
  def after_update_path_for(resource)
    user_path(resource.id)
  end

  # パスワードなしでedit
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # ゲストユーザーを削除させない
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to user_path(current_user), alert: 'ゲストユーザーは削除できません'
    end
  end
end
