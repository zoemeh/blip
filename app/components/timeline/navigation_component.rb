# frozen_string_literal: true

class Timeline::NavigationComponent < ViewComponent::Base

  def initialize(active: nil)
    @active = active
  end

  def tabs
    [
      ["Timeline", timeline_path], ["@Mentions", mentions_path],
      ["Reblips", "#"], ["Searches", "#"],
      ["Lists", "#"]
    ]
  end
end
