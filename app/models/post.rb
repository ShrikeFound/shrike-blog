class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail
  has_one_attached :banner
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

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

  def tag_list 
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end


end
