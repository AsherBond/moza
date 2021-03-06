class AddAttachmentBackgroundImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :background_image
    end
  end

  def self.down
    drop_attached_file :users, :background_image
  end
end
