class CreateApplicationRatings < ActiveRecord::Migration
  def self.up
    create_table :application_ratings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :application_ratings
  end
end
