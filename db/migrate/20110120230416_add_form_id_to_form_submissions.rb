class AddFormIdToFormSubmissions < ActiveRecord::Migration
  def self.up
    add_column :form_submissions, :form_id, :integer
  end

  def self.down
    remove_column :form_submissions, :form_id
  end
end
