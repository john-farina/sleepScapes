class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    #not allowing swears in names
    if Obscenity.profane?(@user.name)
    else
    if @user.save
      sign_in @user
     redirect_to home_path
    else
      render template: "users/new", status: :unprocessable_entity
    end
  end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to home_path
    end
  end

  def user_from_params
      email = user_params.delete(:email)
      name = user_params.delete(:name)
      profile_picture = user_params.delete(:profile_picture)
      profile_banner = user_params.delete(:profile_banner)
      password = user_params.delete(:password)

      Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.name = name
      user.profile_picture = profile_picture
      user.profile_banner = profile_banner
      user.password = password
      end
  end

  def user_params
      params.require(:user).permit(:email, :name, :profile_picture, :profile_banner, :password)
  end

end
