class Topic < ActiveRecord::Base
	validates :description, :name, :presence => true
	belongs_to :forum
	belongs_to :user
	# has_many :posts, :dependent => :destroy
	has_many :subjects
end
