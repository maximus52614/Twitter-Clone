class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  mount_uploader :picture, PictureUploader

  has_many :tweets
  acts_as_follower
  acts_as_followable

  def tweet_feed

  end
end
