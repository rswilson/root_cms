class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :name
      t.string :description
      t.string :notification_address
      t.boolean :send_notification
      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
