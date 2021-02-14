class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
  end

  private

    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(
        :account_update, keys: [:name, :first_name, :last_name, :first_name_ruby,
                                :last_name_ruby, :gender, :birthday, :age, :license,
                                :career, :zip_code, :perfecture, :city, :town,
                                :phone_number, :self_promotion, :work_times
                                ])
    end
end
