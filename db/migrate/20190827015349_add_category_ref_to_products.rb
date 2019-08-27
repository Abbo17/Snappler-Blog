class AddCategoryRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category, :reference
  end
end
