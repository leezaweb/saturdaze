class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :name
      t.integer :price_in_cents
      t.string :description

      t.timestamps
    end
  end
end
