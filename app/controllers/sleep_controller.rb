class SleepController < ApplicationController
  def index
    @users = User.all
  end
end
