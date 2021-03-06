class Place < ActiveRecord::Base
	validates :description, :name, :address, :phone, :email, :category, :presence => true
	geocoded_by :address
	after_validation :geocode 
	scope :closest_three, -> {limit(3)}
end
