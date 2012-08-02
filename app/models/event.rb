class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :date, :hour, :owner_id, :cover

  belongs_to :owner, :class_name => "User"
  has_many :joins, :class_name => "Event::Join"
  has_many :users, :through => :joins
  
  mount_uploader :cover, CoverUploader
  def has_user?(user_id)
    self.joins.collect(&:user_id).include?(user_id)
  end  
end

