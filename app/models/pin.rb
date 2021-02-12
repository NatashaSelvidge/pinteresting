class Pin < ApplicationRecord
  acts_as_votable
  belongs_to :user
  # belongs_to :category
  has_many :users, through: :comments
  has_many :comments, dependent: :destroy 
  
  has_attached_file :image, styles: { medium: "300x300>" }

 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
