class AddCommentCustomizationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blockquote_border_color, :string
    add_column :users, :blockquote_color, :string
    add_column :users, :comment_textarea_color, :string
    add_column :users, :comment_textarea_border_color, :string
    add_column :users, :comment_textarea_background, :string
  end
end
