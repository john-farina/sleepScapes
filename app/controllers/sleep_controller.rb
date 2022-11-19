class SleepController < ApplicationController
  def index
    @users = User.all
  end

  def home
  end
end
