class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :realname, presence: true
  validates :username, uniqueness: true

  has_many :blips
  def to_param
    username
  end

  def mentions
    # FIXME: this matches blips where the mentions is inside words
    # ex: 'a blip@myusermention' where 'myuser' is a username; this is wrong.
    Blip.where("content LIKE ?", "%@#{username}%")
  end
end
