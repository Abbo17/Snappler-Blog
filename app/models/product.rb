class Product < ApplicationRecord
    belongs_to  :category
    has_many_attached :images
   
    has_many :product_tags
    has_many :tags,through: :product_tags

    scope :search,->(parametro){
		where('name LIKE ? OR description LIKE ?', "%#{parametro}%", "%#{parametro}%")
	}
end