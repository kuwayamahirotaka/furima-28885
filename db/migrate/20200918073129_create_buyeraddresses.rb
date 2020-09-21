class CreateBuyeraddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyeraddresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture,               null: false
      t.string :city,           default: "",  null: false
      t.string :house_number,   default: "",  null: false
      t.string :building_name,  default: ""
      t.string :phonenumber,  default: "",  null: false
      t.references :user,                     foreign_key: true
      t.timestamps
    end
  end
end
