class Comment < ActiveRecord::Base
	belongs_to :subject
	belongs_to :user
	mount_uploader :photo, PhotoUploader
end
