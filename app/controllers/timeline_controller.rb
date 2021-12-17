class TimelineController < ApplicationController
  before_action :authenticate_user!
  def index
    @blips = Blip.order(created_at: :desc).limit(100)
  end

  def mentions
  end
end
