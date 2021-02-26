class RecruitsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = current_user.recruits.build(recruit_params)
    @recruit.image.attach(params[:recruit][:image])
    if @recruit.save
      flash[:notice] = "投稿に成功しました！"
      redirect_to user_path(current_user.id)
    else
      @feed_items = []
      flash.now[:alert] = "投稿に失敗しました"
      render new_recruit_path
    end
  end

  def index
    @recruits = Recruit.paginate(page: params[:page], per_page: 20)
  end

  def show
    @recruits = Recruit.all
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    @recruit = recruit.find(params[:id])
    if @recruit.update(recruit_params)
      flash[:notice] = "企業情報を編集しました"
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "更新に失敗しました"
      render edit_recruit_path(current_user.id)
    end
  end

  def destroy
    @recruit.destroy
    flash[:notice] = "求人を削除しました。"
    redirect_to request.referrer || root_url
  end

  private

  def recruit_params
    params.require(:recruit).permit(:co_name, :title, :description, :pay, :work_style,
                                    :postcode, :prefecture_code, :city, :street, :phone_number,
                                    :access, :web_site, :transportation, :required_license, :image)
  end

  def correct_user
    @recruit = current_user.recruits.find_by(id: params[:id])
    redirect_to root_url if @recruit.nil?
  end
end
