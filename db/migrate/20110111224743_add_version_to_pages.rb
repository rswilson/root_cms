class AddVersionToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :version, :integer, :default => 1
  end
  def self.down
    remove_column :pages, :version
  end
end