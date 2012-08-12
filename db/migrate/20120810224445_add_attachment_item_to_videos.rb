class AddAttachmentItemToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.has_attached_file :item
    end
  end

  def self.down
    drop_attached_file :videos, :item
  end
end
