# frozen_string_literal: true

class Timeline::BlipComponent < ViewComponent::Base
  def initialize(blip:)
    @blip = blip
  end

  def username
    @blip.user.username
  end

  def realname
    @blip.user.realname
  end

  def date
    "#{helpers.time_ago_in_words @blip.created_at} ago"
  end

  def content
    h(@blip.content).gsub /@\w+/ do |mention|
      #"<a href='#{profile_path(mention[1..-1])}' class='font-semibold'>#{mention}</a>"
      "<a href='#' class='font-semibold'>#{mention}</a>"
    end
  end
end
