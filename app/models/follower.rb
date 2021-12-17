class Follower < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  validates :follower, uniqueness: { scope: :followee }
  validate :cant_follow_itself


  def cant_follow_itself
    if follower_id == followee_id
      errors.add(:follower, :follows_itself, message: "can't follow itself")
    end
  end
end