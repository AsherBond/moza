class AddFeaturedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :featured, :boolean
  end
end
