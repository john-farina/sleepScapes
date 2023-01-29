class SleepController < ApplicationController
  def index
    @users = User.all
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]
    @random_video = Sleepscape.find(admin_like.liked_id).sleepscape_video
  end

  def testing
    movie = FFMPEG::Movie.new(url_for(Sleepscape.fifth.sleepscape_video))
    @screenshot = movie.screenshot("screenshot.jpg", seek_time: 2)
  end
end
