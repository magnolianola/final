class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :subjects
  has_many :comments
  has_many :topics
  has_many :items
  has_many :messages
  has_many :messages_received, class_name: "Message", foreign_key: :recipient_id


end
