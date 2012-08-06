class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :date, :hour, :owner_id, :cover, :neighborhood_id

  belongs_to :owner, :class_name => "User"
  has_many :joins, :class_name => "Event::Join"
  has_many :participants, :through => :joins, :source => :user
  belongs_to :neighborhood

  mount_uploader :cover, CoverUploader

  def participants_by_join_date
    participants.order("event_joins.created_at DESC")
  end

  def has_user?(user_id)
    self.joins.collect(&:user_id).include?(user_id)
  end 

  def self.by_localization(localization_id)
    localization_id ||= 4
    if localization_id != 4
      joins(:neighborhood).where(["neighborhoods.localization_id = ?", localization_id])
    else
       unscoped
    end
  end
end

