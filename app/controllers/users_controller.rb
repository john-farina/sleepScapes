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

  ############ END OF CLEARANCE

  def show
    @user = User.find(params[:id])
    @followers = Following.where(:following_id => @user.id)
    @sleepscapes = @user.sleepscapes.all
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def edit_user_form
    @user = User.find(params[:user_id])

    if @user.profile_picture.attached?
      if params[:profile_picture].present?
        @user.profile_picture = params[:profile_picture]
      end
    else
      if params[:profile_picture].present?
        @user.profile_picture = params[:profile_picture]
      end
    end

    if @user.profile_banner.attached?
      if params[:profile_banner].present?
        @user.profile_banner = params[:profile_banner]
      end
    else
      if params[:profile_banner].present?
        @user.profile_banner = params[:profile_banner]
      end
    end

    if params[:name].present?
      @user.name = params[:name]
    end

    if @user.save
      redirect_to root_path
    end
  end

  def following
    @followings = User.find(params[:id]).followings.all
  end

  def followers
    @user = User.find(params[:id])
    @followers = Following.where(:following_id => @user.id)
  end

  def add_following
    @user = User.find(params[:user_id])
    @following = @user.followings.new(following_id: params[:follow_id] )

    if @following.save
      redirect_to  user_page_url(id: params[:follow_id])
    else
    end
  end

  def remove_following
    @user = User.find(params[:user_id])
    @following = Following.find_by(following_id: params[:follow_id])

    if @following.destroy
      redirect_to user_page_url(id: params[:follow_id])
    else
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
