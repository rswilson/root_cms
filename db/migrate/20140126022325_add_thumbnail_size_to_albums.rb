class AddThumbnailSizeToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :thumbnail_size, :string
  end
end
