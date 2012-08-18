class DropNotifications < ActiveRecord::Migration
  def self.down
    drop_table :notifications
  end
end

