class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,      default: "", null: false
      t.integer :prefecture,                   null: false
      t.string :city,             default: "", null: false
      t.string :address,          default: "", null: false
      t.string :building,         default: ""
      t.references :order,                     null: false,  foreign_key: true
      t.references :phone_number
      t.timestamps
    end
  end
end
