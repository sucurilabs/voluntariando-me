class AddDateFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :hour, :time
    add_column :events, :date, :date
    remove_column :events, :start_date
    remove_column :events, :end_date
  end
end
