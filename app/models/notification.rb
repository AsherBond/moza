class Notification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :notify_object_id, :notify_object_type, :from, :message
end
