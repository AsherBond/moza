class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, :unique => true
    add_column :users, :full_name, :string
    add_column :users, :about, :text
    add_column :users, :interests, :text
    add_column :users, :inspirations, :text
    add_column :users, :sounds_like, :text
    add_column :users, :paid, :boolean
    add_column :users, :paid_on, :datetime
  end
end
