class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :band_members, :text
    add_column :users, :band_birth, :date
    add_column :users, :date_of_birth, :date
  end
end
