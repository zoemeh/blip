# frozen_string_literal: true

class Timeline::SidebarComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
