class Tag < ApplicationRecord
    has_many :product_tags
    has_many :products, through: :product_tags	
    max_paginates_per 5
end
