class Blip < ApplicationRecord
  belongs_to :user
  validates :content, length: { within: 1..140 }
end
