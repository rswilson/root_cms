class AddSubmissionMessageToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :submission_message, :string
  end

  def self.down
    remove_column :forms, :submission_message
  end
end
