class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :job_id
      t.string :first_name
      t.string :last_name
      t.text :content
      t.string :cv_file_name
      t.string :cv_content_type
      t.integer :cv_file_size
      t.datetime :cover_letter_updated_at
      t.string :email
      t.boolean :acknowledgement_sent
      t.boolean :submitted_to_hr
      t.boolean :phone_interview
      t.boolean :face_to_face_interview
      t.boolean :job_offer
      t.boolean :job_offer_accepted
      t.boolean :completed_six_months
      t.boolean :money_received
      t.integer :application_rating_id
      t.integer :application_status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
