class Album < ActiveRecord::Base
	belongs_to :user
	has_many :songs
	attr_accessible :active, :description, :featured, :name, :position, :record_label, :year_produced, :cover
	has_many :comments, as: :commentable, :dependent => :destroy

	has_reputation :album_votes, source: :user, aggregated_by: :sum
	has_reputation :song_votes, source: {reputation: :song_votes, of: :songs}, aggregated_by: :sum
	#-----\
	#
	# SEARCH!
	#---------\
	include PgSearch
	pg_search_scope :search, 
							against: [:name, :record_label],
							using: {tsearch: {dictionary: "english"}},
							associated_against: {user: :artist_name, songs: :name}

	def self.text_search(query)
		if query.present?
			search(query)
		else
			scoped
		end
	end

	# Validations
	# -----------
	validates :record_label, 
			  allow_blank: true,
	          length: { 
	            minimum: 2, maximum: 40, 
	            :message => "2-40 characters." 
	          }

	validates :name,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 characters."
	          }

	validates :description,
	          allow_blank: true,
	          length: {
	            minimum: 2, maximum: 500,
	            :message => "2-500 characters."
	          }

	validates_numericality_of :year_produced, :only_integer => true, :message => "can only be whole number."

	validates_inclusion_of :year_produced, :in => 1900..2099, :message => "can only be between 1900 and 2099."

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
