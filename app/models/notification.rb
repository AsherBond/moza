class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :notice
end
