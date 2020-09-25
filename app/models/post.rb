class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail
  has_one_attached :banner
  
  has_rich_text :body

  self.per_page = 10
  extend FriendlyId
  friendly_id :title, use: :slugged


  def optimized_image(image,x,y)
    return image.variant(resize_to_fill: [x,y]).processed
  end

  def add_default_thumbnail
    unless thumbnail.attached?
      self.thumbnail.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpeg")), filename: 'default_image.jpg' , content_type: "image/jpg")
    end
  end


end
