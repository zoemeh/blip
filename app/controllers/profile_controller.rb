class ProfileController < ApplicationController
  def index
    @user = User.find_by_username(params[:username])
    @blips = @user.blips.order(created_at: :desc)
  end
end
