class Item < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, ImageUploader
  acts_as_taggable
end
