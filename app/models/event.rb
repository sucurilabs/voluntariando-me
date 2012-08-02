class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :start_date, :owner_id

  belongs_to :owner, :class_name => "User"
  has_many :joins, :class_name => "Event::Join"
  has_many :users, :through => :joins
  
  def has_user?(user_id)
    self.joins.collect(&:user_id).include?(user_id)
  end  
end

