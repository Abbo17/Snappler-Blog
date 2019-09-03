class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      
      t.string  :name,                     null:false
      t.string  :description,              null: false
      t.integer :cod,                      null:false
      t.float   :price,                    default:0.0
      t.float   :cost,                     default:0.0
      t.boolean :active,                   default:true
      t.integer :imageActive,               default: 0

      t.timestamps
    end

    add_index :products, :name,                unique: true
    add_index :products, :cod,                unique: true
  end
end
##add_index :products, [:name, :cod], :unique => true