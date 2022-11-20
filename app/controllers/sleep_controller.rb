class SleepController < ApplicationController
  def index
    @users = User.all
  end

  def home
  end

  def show
    @user = User.find(params[:id])
    @sleepscapes = @user.sleepscapes.all
  end

  def sleepscape
    @sleepscape = User.find(params[:user_id]).sleepscapes.find(params[:sleepscape_id])
  end

  def like_sleepscape
    @user = current_user
    @sleepscape = Sleepscape.find(params[:sleepscape_id])

    @like = @user.likes.new(params.permit(:user_id, :liked_id))

    if @like.save
      redirect_to sleepscape_page_url(sleepscape_id: @sleepscape.id, user_id: @sleepscape.user_id)
    else
    end
  end

  def remove_like_sleepscape
    @user = User.find(params[:user_id])
    @sleepscape = Sleepscape.find(params[:liked_id])
    @like = @user.likes.find_by(liked_id: params[:liked_id]).destroy

    if @like.destroy
      redirect_to sleepscape_page_url(sleepscape_id: @sleepscape.id, user_id: @sleepscape.user_id)
    else
    end
  end

  def create
    @user = User.find(params[:id])
    @sleepscape = @user.sleepscapes.new(get_params)

    if @sleepscape.save
      redirect_to sleepscape_page_url(user_id: @user.id, sleepscape_id: @sleepscape.id)
    else

    end
  end

  private

  def get_params
    params.permit(:title, :recorded_at, :description, :sleepscape_video, :sleepscape_audio, :sleepscape_still_picture)
  end
end
