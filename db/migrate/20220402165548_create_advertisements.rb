class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :operation_type
      t.integer :usd_price
      t.integer :pen_prince
      t.integer :maintanence
      t.string :photos
      t.string :videos
      t.integer :view_counter
      t.integer :favorites_counter

      t.timestamps
    end
  end
end
