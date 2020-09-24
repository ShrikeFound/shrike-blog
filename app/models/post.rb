class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail
  has_one_attached :banner
  
  has_rich_text :body

  validates :title, length: {minimum: 5}
  validates :description, length: {maximum:150, too_long: "The description must be under 150 characters"}
  validates :body, length: {minimum:50}

  self.per_page = 10
  extend FriendlyId
  friendly_id :title, use: :slugged


  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x,y]).processed
  end



end
