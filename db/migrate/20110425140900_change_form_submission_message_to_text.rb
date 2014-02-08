class ChangeFormSubmissionMessageToText < ActiveRecord::Migration
  def self.up
	change_column :forms, :submission_message, :text
  end

  def self.down
	change_column :forms, :submission_message, :string
  end
end
