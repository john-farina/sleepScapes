class ApplicationController < ActionController::Base
  include Clearance::Controller

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
