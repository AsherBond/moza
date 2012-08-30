class Single < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :playlists
	attr_accessible :active, :lyrics, :name, :position, :file

    has_reputation :song_votes, source: :user, aggregated_by: :sum
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

    validates :name,
    	presence: true,
    	length: {
    	  minimum: 2, maximum: 40,
    	  :message => "2-40 characters."
    	}
    validates :lyrics,
    	allow_blank: true,
    	length: {
    	  minimum: 2, maximum: 1000,
    	  :message => "2-1000 characters."
    	}
  	has_attached_file :file,
		:content_type => ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'],
		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/s3.yml"

end
