class AddNavCustomizationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nav_text_color, :string
    add_column :users, :nav_text_color_hover, :string
    add_column :users, :nav_background_color_hover, :string
    add_column :users, :nav_background_color_active, :string
    add_column :users, :nav_text_color_active, :string
  end
end
