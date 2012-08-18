class RedoNotifications < ActiveRecord::Migration
  def self.down
    drop_table :notifications
    create_table :notifications do |t|
      t.references :user
      t.integer :from
      t.integer :notify_object_id
      t.string  :notify_object_type
      t.string  :message

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end

