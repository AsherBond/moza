class AddBackgroundCustomizationToUser < ActiveRecord::Migration
  def change
    add_column :users, :background_color, :string
    add_column :users, :background_attachment, :string
    add_column :users, :background_position, :string
    add_column :users, :background_repeat, :string
    add_column :users, :background_image_active, :boolean
    add_column :users, :content_background_color, :string
    add_column :users, :content_background_color_active, :boolean
  end
end
