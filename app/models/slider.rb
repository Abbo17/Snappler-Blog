class Slider < ApplicationRecord
    has_one_attached :image
    max_paginates_per 5
end
