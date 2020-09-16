class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, default: ""
      t.text :show, null: false,default: ""
      t.integer :category_id, null: false, default: ""
      t.integer :status_id, null: false, default: ""
      t.integer :transfee_id, null: false, default: ""
      t.integer :transregion_id, null: false, default: ""
      t.integer :transdate_id, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.timestamps
    end
  end
end
