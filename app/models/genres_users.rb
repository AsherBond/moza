class GenresUsers < ActiveRecord::Base
  attr_accessible :genre_id, :user_id
  has_many :users
  has_many :genres
end
