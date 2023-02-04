class SoundscapeController < ApplicationController
  def sleepscape
    @sleepscape = User.find(params[:user_id]).sleepscapes.find(params[:sleepscape_id])
    @comments = @sleepscape.comments.order(created_at: :desc).all
    @all_likes = Like.where(:liked_id => @sleepscape.id)
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

  def edit_soundscape
    @soundscape = Sleepscape.find(params[:id])

    if params[:study_category] === "1"
      if !@soundscape.categorys.find_by(category: "study")
        @soundscape.categorys.new(category: 'study')
      end
    end

    if params[:study_category] === "0"
      if @soundscape.categorys.find_by(category: "study")
        @soundscape.categorys.find_by(category: "study").destroy
      end
    end

    if params[:distract_category] === "1"
      if !@soundscape.categorys.find_by(category: "distraction")
        @soundscape.categorys.new(category: 'distraction')
      end
    end

    if params[:distract_category] === "0"
      if @soundscape.categorys.find_by(category: "distraction")
        @soundscape.categorys.find_by(category: "distraction").destroy
      end
    end

    if params[:sleep_category] === "1"
      if !@soundscape.categorys.find_by(category: "sleep")
        @soundscape.categorys.new(category: 'sleep')
      end
    end

    if params[:sleep_category] === "0"
      if @soundscape.categorys.find_by(category: "sleep")
        @soundscape.categorys.find_by(category: "sleep").destroy
      end
    end

    if params[:title] != @soundscape.title
      @soundscape.title = params[:title]
    end

    if params[:location] != @soundscape.recorded_at
      @soundscape.recorded_at = params[:location]
    end

    if params[:description] != @soundscape.description
      @soundscape.description = params[:description]
    end

    if @soundscape.save
      redirect_to sleepscape_page_url(user_id: @soundscape.user_id, sleepscape_id: @soundscape.id)
    end
  end

  def delete_soundscape
    @soundscape = Sleepscape.find(params[:id])

    if @soundscape.destroy
      redirect_to user_page_url(id: @soundscape.user_id)
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
