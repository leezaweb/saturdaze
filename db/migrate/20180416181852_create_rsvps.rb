class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.integer :event_id
      t.integer :guest_id
      t.boolean :is_commited

      t.timestamps
    end
  end
end
