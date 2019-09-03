class CreateLogos < ActiveRecord::Migration[5.2]
  def change
    create_table :logos do |t|


      t.timestamps
    end
  end
end
