class CreateGenresUsers < ActiveRecord::Migration
  def change
    create_table :genres_users do |t|
      t.integer :user_id
      t.integer :genre_id

    end

  	add_index :genres_users, :user_id
  	add_index :genres_users, :genre_id
  end
end
