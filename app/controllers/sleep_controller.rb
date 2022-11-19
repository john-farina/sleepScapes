class SleepController < ApplicationController
  def index
    @users = User.all
  end

  def home
  end

  def show
    @user = User.find(params[:id])
  end
end
