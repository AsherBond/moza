class AddSearchIndexToAlbums < ActiveRecord::Migration
  def up
    execute "create index album_name on albums using gin(to_tsvector('english', name))"
  end

  def down
    execute "drop index album_name"
  end
end
