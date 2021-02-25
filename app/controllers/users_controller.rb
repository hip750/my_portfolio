class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @recruits = @user.recruits.paginate(page: params[:page])
    @recruit  = current_user.recruits.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end
