class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
 
  has_many :pins
  has_many :comments
  has_many :commented_pins, through: :comments, source: :pins
  has_many :votes, through: :pins

    
  # has_many :categories, through: :pins
  # def username
  #   email.split('@')[0]
  # end 

end
