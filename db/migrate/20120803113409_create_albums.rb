class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :position
      t.boolean :active
      t.boolean :featured
      t.text :description
      t.string :record_label
      t.integer :year_produced
      t.references :user

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
