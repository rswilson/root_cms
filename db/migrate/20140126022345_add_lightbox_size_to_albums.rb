class AddLightboxSizeToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :lightbox_size, :string
  end
end
