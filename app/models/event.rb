class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :active, :details, :end, :name, :start, :ticket_info, :ticket_link
end
