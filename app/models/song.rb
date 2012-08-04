class Song < ActiveRecord::Base
  belongs_to :album
  attr_accessible :active, :lyrics, :name, :position
end
