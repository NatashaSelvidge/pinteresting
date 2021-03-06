class User < ApplicationRecord

devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :validatable,
      :omniauthable, :omniauth_providers => [:facebook]
  
      has_many :pins
      has_many :comments
      has_many :comments_on_my_pins, through: :pins, source: :comment 
      has_many :commented_pins, through: :comments, source: :pin 
      has_many :votes, through: :pins

     def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
end
