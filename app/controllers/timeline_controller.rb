class TimelineController < ApplicationController
  before_action :authenticate_user!
  def index
    @blips = Blip.order(created_at: :desc).limit(100)
  end

  def mentions
    @blips = current_user.mentions.order(created_at: :desc).limit(100)
  end

  def blipit
    @blip = Blip.new(blip_params)
    @blip.user = current_user
    if @blip.save
      redirect_to timeline_index_path
    else
      flash.alert = "I cannot post your blip"
      redirect_back fallback_location: root_path
      #render json: @blip.errors, status: :unprocessable_entity
    end
  end
  private

  def blip_params
    params.require(:blip).permit(:content)
  end
end
