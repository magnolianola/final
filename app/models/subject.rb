class Subject < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user
	has_many :comments
	accepts_nested_attributes_for :comments

	mount_uploader :photo, PhotoUploader
end
