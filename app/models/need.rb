class Need < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :quantity
end
