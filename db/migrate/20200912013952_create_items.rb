class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false, default: ""
      t.text :show, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :transfee_id, null: false
      t.integer :transregion_id, null: false
      t.integer :transdate, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
