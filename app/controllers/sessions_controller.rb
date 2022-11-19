class SessionsController < Clearance::SessionsController  private
private
  def redirect_signed_in_users
    if signed_in?
      redirect_to home_path
    end
  end

  def url_after_destroy
    root_path
  end

  def url_for_signed_in_users
    home_path
  end
end
