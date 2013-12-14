class Place < ActiveRecord::Base
	validates :description, :name, :address, :phone, :email, :presence => true
end
