class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      
      t.string  :name,                     null:false
      t.string  :description,              null: false
      t.integer :cod,                      null:false
      t.float   :price,                    default:0.0
      t.float   :cost,                     default:0.0
      t.boolean :active,                   default:true

      t.timestamps
    end
  end
end
