class AddBasicCustomizationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :content_header_color, :string
    add_column :users, :content_small_header_color, :string
    add_column :users, :content_text_color, :string
    add_column :users, :hr_color_top, :string
    add_column :users, :hr_color_bottom, :string
    add_column :users, :hrd_color_top, :string
    add_column :users, :hrd_color_bottom, :string
  end
end
