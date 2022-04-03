class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :type
      t.string :subtype
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :restorooms
      t.integer :parking_lots
      t.float :total_area
      t.float :built_area
      t.integer :antiquity
      t.references :advertisement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
