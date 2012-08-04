class AddNeighborhoodIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :neighborhood_id, :integer
  end
end
