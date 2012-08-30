class CreateSingles < ActiveRecord::Migration
  def change
    create_table :singles do |t|
      t.string :name
      t.text :lyrics
      t.boolean :active
      t.references :user

      t.timestamps
    end
    add_index :singles, :user_id
  end
end
