class Gallery < ActiveRecord::Base
	belongs_to :user
	has_many :images
	has_many :comments, as: :commentable, :dependent => :destroy

	attr_accessible :description, :name, :cover
  	has_attached_file :cover, 
                      :styles => {
                        :small => "150x150#", 
                        :full_small => "150x150>", 
                        :medium => "400x400#", 
                        :full_medium => "400x400>", 
                        :large => "900x900#", 
                        :full_large => "900x900>",
                        :avatar => "60x60#"
                      },
			  		  :storage => :s3,
					  :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :default_url => 'http://placehold.it/400x400'
end
