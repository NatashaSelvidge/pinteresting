class Pin < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_many :users, through: :comments
  
  has_attached_file :image, styles: { medium: "300x300>" }
  
  validates :image, :title, :description, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :alpha, -> { order(:title) }

  scope :most_comments, -> { joins(:comments).group('pins.id').order('count(pins.id) desc')}
  
  
end
