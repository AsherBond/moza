class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :name
end
