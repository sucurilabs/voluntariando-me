class NeighborhoodsController < ApplicationController

  def list
    @neighborhoods = Neighborhood.find_all_by_localization_id(params[:localization_id])
    render :json => @neighborhoods.collect {|n| {:name => n.name, :value => n.id} }
  end

end
