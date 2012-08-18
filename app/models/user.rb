class User < ActiveRecord::Base
	rolify
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me,
					:username, :full_name, :about, :interests, :inspirations, :sounds_like, :gender,
					:phone, :state, :city, :country, :date_of_birth, :band_birth, :band_members,
					:login, :artist_name, :genre_ids, :slug, :profile_photo,
					:background_image, :background_color, :background_attachment, :background_position, :background_repeat, :background_image_active, :content_background_color, :content_background_color_active,
					:header_background_color, :header_color, :header_small_color,
					:link_color, :link_color_hover,
					:thumbnail_background_color, :thumbnail_border_color, :thumbnail_border_color_hover,
					:blockquote_border_color, :blockquote_color, :comment_textarea_color, :comment_textarea_border_color, :comment_textarea_background,
					:nav_text_color, :nav_text_color_hover, :nav_background_color_hover, :nav_background_color_active, :nav_text_color_active, :content_header_color, :content_small_header_color, :content_text_color, :hr_color_top, :hr_color_bottom, :hrd_color_top, :hrd_color_bottom
	# attr_accessible :title, :body
	has_many :comments, as: :commentable, :dependent => :destroy
	has_many :galleries
	has_many :events
	has_many :notifications
	has_many :albums
	has_many :videos
	has_many :playlists
	has_and_belongs_to_many :genres


	#-----\
	#
	# FOLLOW!
	#---------\
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",
	                                 class_name: "Relationship",
	                                 dependent: :destroy

	has_many :followers, through: :reverse_relationships, source: :follower

	def following?(other_user)
		relationships.find_by_followed_id(other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by_followed_id(other_user.id).destroy
	end
	#-----\
	#
	# SLUGS!
	#---------\
	extend FriendlyId
	friendly_id :username, use: :slugged

	#-----\
	#
	# Voting!
	#---------\
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	has_reputation :album_votes, source: {reputation: :album_votes, of: :albums}, aggregated_by: :sum

	def voted_for?(album)
	  evaluations.where(target_type: album.class, target_id: album.id).present?
	end

	def is_active? 
		!artist_name.nil?
	end

	def total_votes 
		reputation_value_for(:album_votes).to_i
	end

	#-----------------------------@*@*\
	#
	# * Profile Image *
	#
	#-----------------------------@*@*\
	#
	has_attached_file :profile_photo, 
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

	has_attached_file :background_image, 
                      :styles => {
                        :small => "150x150#", 
                      },
  					  :storage => :s3,
					  :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :default_url => 'http://placehold.it/400x400'
	#-----\
	#
	# Valid email regex.
	#---------\
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# Validate the current users email with a regex.
	# -----
	validates :email,
	          presence: true,
	          format: {with: VALID_EMAIL_REGEX, :message => "is not a valid email"},
	          uniqueness: {case_sensitive: false, :message => "is already registered"}
	# Validations
	# -----------
	validates :username,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 letters."
	          }
	validates :full_name,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 letters."
	          }

	validates :gender, presence: true

	validates :phone,
	          length: {
	            minimum: 9, maximum: 15,
	            :message => "9-15 letters."
	          },
	          :allow_nil => true, :allow_blank => true

	# Artist only Validations
	# -----------
	validates :interests,
	          length: {
	            minimum: 5, maximum: 300,
	            :message => "5-300 letters."
	          },
	          :if => :is_artist?,
	          :allow_nil => true, :allow_blank => true
	          
	validates :inspirations,
	          length: {
	            minimum: 5, maximum: 300,
	            :message => "5-300 letters."
	          },
	          :if => :is_artist?,
	          :allow_nil => true, :allow_blank => true
	          
	validates :sounds_like,
	          length: {
	            minimum: 5, maximum: 300,
	            :message => "5-300 letters."
	          },
	          :if => :is_artist?,
	          :allow_nil => true, :allow_blank => true
	          
	validates :band_members,
	          length: {
	            minimum: 5, maximum: 300,
	            :message => "5-300 letters."
	          },
	          :if => :is_artist?,
	          :allow_nil => true, :allow_blank => true
	          
	validates :artist_name,
	          presence: true,
	          length: {
	            minimum: 2, maximum: 40,
	            :message => "2-40 letters."
	          },
	          :if => :is_artist?

	def is_artist?
		self.has_role? :artist
	end

	def is_fan?
		self.has_role? :fan
	end

	# Username login
	attr_accessor :login

	# Check role
	def has_role?(role_sym)
		roles.any? { |r| r.name.underscore.to_sym == role_sym }
	end

	# overrrRiddddee devises ar statement
    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
end
