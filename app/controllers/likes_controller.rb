class LikesController < ApplicationController
  def create
    @recruit = Recruit.find(params[:recruit_id])
    @like = current_user.likes.build(recruit_id: params[:recruit_id])
    @like.save
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @recruit = Recruit.find(params[:recruit_id])
    @like = Like.find_by(recruit_id: params[:recruit_id], user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end
end
