class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  acts_as_follower
  acts_as_followable

  Class User < ActiveRecord::Base
   has_many :posts

   has_many :subscribed, class_name: "Relationship", foreign_key: "followed_id"
   has_many :followers, class_name: "Relationship", foreign_key: "follower_id"
end
