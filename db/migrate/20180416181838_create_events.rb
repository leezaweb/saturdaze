class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :location_id
      t.integer :host_id

      t.timestamps
    end
  end
end
