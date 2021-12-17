# frozen_string_literal: true

class Shared::ButtonComponent < ViewComponent::Base
  def initialize(type: :button, classes: "")
    @type = type
    @classes = classes
  end
end
