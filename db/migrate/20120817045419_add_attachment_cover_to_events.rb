class AddAttachmentCoverToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :events, :cover
  end
end
