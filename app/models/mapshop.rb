class Mapshop < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :name
    validates :postal
    validates :address
    validates :tell
    validates :begin_at
    validates :closed_at
  end

end
