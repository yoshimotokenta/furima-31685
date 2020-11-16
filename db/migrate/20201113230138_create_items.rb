class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :seller_id,        null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :area_id,          null: false
      t.integer :estimated_id,     null: false
      t.integer :price,            null: false
      t.references :user,           foreign_key: true
      t.string :name,              null: false
      t.text :info,                null: false
      t.timestamps
    end
  end
end
