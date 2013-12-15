class Place < ActiveRecord::Base
	validates :description, :name, :address, :phone, :email, :presence => true
	geocoded_by :address
	after_validation :geocode 
end
