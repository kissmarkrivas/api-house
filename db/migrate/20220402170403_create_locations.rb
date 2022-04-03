class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :department
      t.string :province
      t.string :district
      t.string :urbanization
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
