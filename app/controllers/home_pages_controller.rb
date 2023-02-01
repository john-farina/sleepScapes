class HomePagesController < ApplicationController
  def index
    @users = User.all

    if AdminLike.count > 0
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]

    @random_video = Sleepscape.find(admin_like.liked_id).sleepscape_video
    end
  end

  def home
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]

    if Sleepscape.count > 1
      @random_post = Sleepscape.find(admin_like.liked_id)
    end

    @admin_likes = AdminLike.all
    @recent_posts = Sleepscape.order('created_at DESC').limit(4)
    @recent_users = User.order('created_at DESC').limit(6)
  end

  def sleep_home
    @all_sleepscapes = []
    @curated_sleepscapes = []
    sleepscapes = Category.where(:category => "sleep")
    x = 0

    while x < sleepscapes.length
      @all_sleepscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))

      if AdminLike.find_by(liked_id: sleepscapes[x].sleepscape_id)
        @curated_sleepscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))
      end

      x = x + 1
    end

    if @curated_sleepscapes.length > 0
      @random_post = @curated_sleepscapes[ rand(@curated_sleepscapes.length) ]
    end
  end

  def study_home
    @all_studyscapes = []
    @curated_studyscapes = []
    sleepscapes = Category.where(:category => "study")
    x = 0

    while x < sleepscapes.length
      @all_studyscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))

      if AdminLike.find_by(liked_id: sleepscapes[x].sleepscape_id)
        @curated_studyscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))
      end

      x = x + 1
    end

    if @curated_sleepscapes
      @random_post = @curated_studyscapes[ rand(@curated_studyscapes.length) ]
    end
  end

  def distraction_home
    @all_distractscapes = []
    @curated_distractscapes = []
    sleepscapes = Category.where(:category => "distraction")
    x = 0

    while x < sleepscapes.length
      @all_distractscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))

      if AdminLike.find_by(liked_id: sleepscapes[x].sleepscape_id)
        @curated_distractscapes.push(Sleepscape.find(sleepscapes[x].sleepscape_id))
      end

      x = x + 1
    end

    if @curated_distractscapes
      @random_post = @curated_distractscapes[ rand(@curated_distractscapes.length) ]
    end
  end

  def curated_home

  end

  def recent_soundscapes_home

  end

  def users_home
    @all_users = User.all
  end

end
