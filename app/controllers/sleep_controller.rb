class SleepController < ApplicationController
  def index
    @users = User.all
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]
    @random_video = Sleepscape.find(admin_like.liked_id).sleepscape_video
  end

  def home
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]
    @random_post = Sleepscape.find(admin_like.liked_id)
    @admin_likes = AdminLike.all

    @recent_posts = Sleepscape.order('created_at DESC').limit(4)
    @recent_users = User.order('created_at DESC').limit(6)
  end

  def sleep_home
  end

  def study_home
  end

  def distraction_home
  end

  def curated_home
  end

  def recent_soundscapes_home
  end

  def users_home
  end

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

  def sleepscape
    @sleepscape = User.find(params[:user_id]).sleepscapes.find(params[:sleepscape_id])
    @comments = @sleepscape.comments.order(created_at: :desc).all
    @all_likes = Like.where(:liked_id => @sleepscape.id)
  end

  def create_comment
    @sleepscape = Sleepscape.find(params[:sleepscape_id])
    @comment_text = params[:content]

    if Obscenity.profane?(@comment_text)
     @comment_text = Obscenity.sanitize(@comment_text)
    end

    @comment = @sleepscape.comments.new(content: @comment_text, user_id: params[:user_id])

    if @comment.save
      redirect_to sleepscape_page_url(sleepscape_id: @sleepscape.id, user_id: @sleepscape.user_id)
    else
    end
  end

  def like_sleepscape
    @user = current_user
    @sleepscape = Sleepscape.find(params[:sleepscape_id])

    @like = @user.likes.new(params.permit(:user_id, :liked_id))

    if @like.save
      redirect_to sleepscape_page_url(sleepscape_id: @sleepscape.id, user_id: @sleepscape.user_id)
    else
    end
  end

  def remove_like_sleepscape
    @user = User.find(params[:user_id])
    @sleepscape = Sleepscape.find(params[:liked_id])
    @like = @user.likes.find_by(liked_id: params[:liked_id]).destroy

    if @like.destroy
      redirect_to sleepscape_page_url(sleepscape_id: @sleepscape.id, user_id: @sleepscape.user_id)
    else
    end
  end

  def create
    @user = User.find(params[:id])
    @sleepscape = @user.sleepscapes.new(get_params)

    if Obscenity.profane?(@sleepscape.title)
      @sleepscape.title = Obscenity.sanitize(@sleepscape.title)
    end

    if Obscenity.profane?(@sleepscape.recorded_at)
      @sleepscape.recorded_at = Obscenity.sanitize(@sleepscape.recorded_at)
    end

    if Obscenity.profane?(@sleepscape.description)
      @sleepscape.description = Obscenity.sanitize(@sleepscape.description)
    end

    if @sleepscape.save
      redirect_to sleepscape_page_url(user_id: @user.id, sleepscape_id: @sleepscape.id)
    else

    end
  end

  def secret_admin
  end

  def create_secret_admin
    @user = User.find(params[:id])

    @user.admin = true

    if @user.save
      redirect_to root_path
    end
  end

  def admin_like
    @like = AdminLike.new(user_id: params[:id], liked_id: params[:liked_id])

    if @like.save
      redirect_to root_path
    end
  end

  def admin_dislike
    @like = AdminLike.find_by(liked_id: params[:id])

    if @like.destroy
      redirect_to root_path
    end
  end

  private

  def get_params
    params.permit(:title, :recorded_at, :description, :sleepscape_video, :sleepscape_audio, :sleepscape_still_picture)
  end
end
