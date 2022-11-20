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
    params.permit(:title, :recorded_at, :description, :sleepscape_video, :sleepscape_audio)
  end
end
