class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  # mount_uploader :image, ImageUploader
  has_many :reviews

  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  validates :name, presence: true
  validates :profile, length: { maximum: 120 }

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        # remote_image_url: auth.info.image,
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        profile: auth.info.description,
        link: auth.info.urls.Twitter
      )
    end

    user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
