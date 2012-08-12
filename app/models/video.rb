class Video < ActiveRecord::Base
	belongs_to :user
	attr_accessible :active, :description, :name, :youtube_url
	has_many :comments, as: :commentable, :dependent => :destroy

  	has_attached_file :item,
  		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/s3.yml"
end
