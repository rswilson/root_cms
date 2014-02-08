class AddSubmitButtonToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :submit_button, :string
  end

  def self.down
    remove_column :forms, :submit_button
  end
end
