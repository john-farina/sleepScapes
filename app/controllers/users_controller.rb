class UsersController < Clearance::UsersController

  private

  def user_from_params
      email = user_params.delete(:email)
      name = user_params.delete(:name)
      password = user_params.delete(:password)

      Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.name = name
      user.password = password
      end
  end

  def user_params
      params.require(:user).permit(:email, :name, :password)
  end

end
