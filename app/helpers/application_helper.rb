module ApplicationHelper

  def title_helper(title)
    if title.present?
      title + "[soundScapes]"
    else
      "[soundScapes]"
    end
  end

end
