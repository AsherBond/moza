class Image < ActiveRecord::Base
	belongs_to :gallery
	attr_accessible :description, :name, :item
	has_many :comments, as: :commentable, :dependent => :destroy

  	has_attached_file :item, 
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
