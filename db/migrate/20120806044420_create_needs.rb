class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.references :event
      t.string :name
      t.integer :quantity

      t.timestamps
    end
    add_index :needs, :event_id
  end
end
