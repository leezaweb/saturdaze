class CreateEventAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :event_amenities do |t|
      t.integer :event_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
