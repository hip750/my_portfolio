class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @recruit = Recruit.find(params[:recruit_id])
    @review = @recruit.reviews.build(review_params)
    @review.user_id = current_user.id
    @review_recruit = @review.recruit
    if @review.save
      flash[:notice] = 'レビューを投稿しました'
      redirect_to recruit_path(@recruit)
    else
      flash[:alert] = 'レビューに失敗しました。「評価」「レビュー内容」の両方を入力してください。'
      redirect_to recruit_path(@recruit)
    end
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = 'レビューを削除しました'
      redirect_to recruit_path(@recruit)
    else
      flash[:alert] = 'レビューの削除に失敗しました'
      redirect_to recruit_path(@recruit)
    end
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :content, :recruit_id, :user_id)
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to root_url if @review.nil?
  end
end
