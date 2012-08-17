class AddAttachmentItemToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.has_attached_file :item
    end
  end

  def self.down
    drop_attached_file :images, :item
  end
end
