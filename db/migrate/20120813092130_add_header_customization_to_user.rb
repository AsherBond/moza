class AddHeaderCustomizationToUser < ActiveRecord::Migration
  def change
    add_column :users, :header_background_color, :string
    add_column :users, :header_color, :string
    add_column :users, :header_small_color, :string
  end
end
