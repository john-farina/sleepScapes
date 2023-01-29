class HomePagesController < ApplicationController
  def home
    admin_like = AdminLike.all[ rand(AdminLike.all.length) ]
    @random_post = Sleepscape.find(admin_like.liked_id)
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

    @random_post = @curated_sleepscapes[ rand(@curated_sleepscapes.length) ]
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

    @random_post = @curated_studyscapes[ rand(@curated_studyscapes.length) ]
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

    @random_post = @curated_distractscapes[ rand(@curated_distractscapes.length) ]
  end

  def curated_home

  end

  def recent_soundscapes_home

  end

  def users_home
    @all_users = User.all
  end

end
