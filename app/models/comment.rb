class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  attr_accessible :content
  
  validates :content,
          presence: true,
          length: {
            minimum: 2, maximum: 250,
            :message => "you have exceded 250 letters"
          }
end
