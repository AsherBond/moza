class AddThumbnailCustomizationToUser < ActiveRecord::Migration
  def change
    add_column :users, :thumbnail_background_color, :string
    add_column :users, :thumbnail_border_color, :string
    add_column :users, :thumbnail_border_color_hover, :string
  end
end
