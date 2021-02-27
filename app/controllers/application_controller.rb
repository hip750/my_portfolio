class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(
        :account_update, keys: [
          :name, :first_name, :last_name, :first_name_ruby,
          :last_name_ruby, :gender, :birthday, :age, :license,
          :career, :postcode, :prefecture_code, :city, :street,
          :phone_number, :self_promotion, :work_times,
        ]
      )
    end
end
