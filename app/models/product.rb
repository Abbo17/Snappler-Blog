class Product < ApplicationRecord
    belongs_to  :category
    has_one_attached :image
   
    has_many :product_tags
    has_many :tags,through: :product_tags
end