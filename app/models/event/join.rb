class Event::Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :event_id, :user_id

end
