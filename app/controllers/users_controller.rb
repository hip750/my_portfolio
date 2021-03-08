class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @recruits = @user.recruits.paginate(page: params[:page], per_page: 20)
    @recruit  = current_user.recruits.build
    @like_recruits = @user.like_recruits.paginate(page: params[:page], per_page: 20)
    @recruit_id = Recruit.find_by(id: params[:id])
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end
