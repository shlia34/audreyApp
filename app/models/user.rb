class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :reviews

  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能
end
