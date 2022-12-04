module ApplicationHelper

  def title_helper(title)
    if title.present?
      if title == "sleepDefaultTitleWierdName_-_-"
        "[sleepScapes]"
      elsif title == "studyDefaultTitleWierdName_-_-"
        "[studyScapes]"
      elsif title == "distractDefaultTitleWierdName_-_-"
      "[distractionScapes]"
      else
      title + "[soundScapes]"
      end
    else
      "[soundScapes]"
    end
  end

end
