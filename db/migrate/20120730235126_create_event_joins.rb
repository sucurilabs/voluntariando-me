class CreateEventJoins < ActiveRecord::Migration
  def change
    create_table :event_joins do |t|
      t.references :user
      t.references :event

      t.timestamps
    end
    add_index :event_joins, :user_id
    add_index :event_joins, :event_id
  end
end
