class Playlist < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :songs
	has_many :comments, as: :commentable, :dependent => :destroy
	attr_accessible :name, :position
end
