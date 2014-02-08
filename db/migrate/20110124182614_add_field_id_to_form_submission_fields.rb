class AddFieldIdToFormSubmissionFields < ActiveRecord::Migration
  def self.up
    add_column :form_submission_fields, :field_id, :integer
  end

  def self.down
    remove_column :form_submission_fields, :field_id
  end
end
