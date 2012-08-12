class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.text :details
      t.string :ticket_link
      t.text :ticket_info
      t.boolean :active
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
