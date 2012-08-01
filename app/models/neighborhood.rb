class Neighborhood < ActiveRecord::Base
  attr_accessible :localization_id, :name
  has_many :users

  LOCALIZATIONS = [
    "Centro",
    "Zona Sul",
    "Zona Norte",
    "Zona Oeste"
  ]

  def localization
    LOCALIZATIONS[self.localization_id]
  end
end
