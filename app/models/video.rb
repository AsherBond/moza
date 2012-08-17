class Video < ActiveRecord::Base
    belongs_to :user
    attr_accessible :active, :description, :name, :youtube_url, :item
    has_many :comments, as: :commentable, :dependent => :destroy

    has_attached_file :item, :styles => { 
      :medium => { :geometry => "640x480", :format => 'flv' },
      :thumb => { :geometry => "640x480#", :format => 'jpg', :time => 10 }
    }, :processors => [:ffmpeg],
    :hash_secret => "Octo__NINJ@___^!",
    :url => "/:class/:id/:style/:hash.:extension",
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml"
end
