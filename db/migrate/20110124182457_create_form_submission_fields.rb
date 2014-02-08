class CreateFormSubmissionFields < ActiveRecord::Migration
  def self.up
    create_table :form_submission_fields do |t|
      t.string :name
      t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :form_submission_fields
  end
end
