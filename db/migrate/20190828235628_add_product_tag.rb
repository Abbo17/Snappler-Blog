class AddProductTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_tags, :product 
  	add_reference :product_tags, :tag
  end
end
