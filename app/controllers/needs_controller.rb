class NeedsController < ApplicationController
  def new
    render :partial => "new", :locals => {:need => Need.new}
  end
end
