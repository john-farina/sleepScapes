class SleepController < ApplicationController
  def testing
    movie = FFMPEG::Movie.new(url_for(Sleepscape.fifth.sleepscape_video))
    @screenshot = movie.screenshot("screenshot.jpg", seek_time: 2)
  end
end
