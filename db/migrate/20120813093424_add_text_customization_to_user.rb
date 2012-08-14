class AddTextCustomizationToUser < ActiveRecord::Migration
  def change
    add_column :users, :regular_text_color, :string
    add_column :users, :heading_text_color, :string
    add_column :users, :small_heading_text_color, :string
    add_column :users, :comment_text_color, :string
    add_column :users, :comment_block_quote_border, :string
    add_column :users, :link_color, :string
    add_column :users, :link_color_hover, :string
  end
end
