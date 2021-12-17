# frozen_string_literal: true

class Profile::SidebarComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
