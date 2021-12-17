class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :realname, presence: true
  validates :username, uniqueness: true

  has_many :blips

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: "followed_users", :dependent => :delete_all

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users, :dependent => :delete_all

  def to_param
    username
  end

  def mentions
    # FIXME: this matches blips where the mentions is inside words
    # ex: 'a blip@myusermention' where 'myuser' is a username; this is wrong.
    Blip.where("content LIKE ?", "%@#{username}%")
  end

  def follow!(user)
    Follower.create(follower: user, followee: self)
  end

  def unfollow!(user)
    Follower.where(follower: user, followee: self).delete_all
  end

  def is_follower_of(user)
    Follower.where(follower: self, followee: user).count > 0
  end

end
