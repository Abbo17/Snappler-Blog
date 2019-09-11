class Category < ApplicationRecord
    has_many    :products
    max_paginates_per 5
end
