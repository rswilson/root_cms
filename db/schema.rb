# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140204112227) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.integer  "gallery_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "thumbnail_size"
    t.string   "lightbox_size"
  end

  create_table "application_ratings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "applications", :force => true do |t|
    t.integer  "job_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "content"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cover_letter_updated_at"
    t.string   "email"
    t.boolean  "acknowledgement_sent"
    t.boolean  "submitted_to_hr"
    t.boolean  "phone_interview"
    t.boolean  "face_to_face_interview"
    t.boolean  "job_offer"
    t.boolean  "job_offer_accepted"
    t.boolean  "completed_six_months"
    t.boolean  "money_received"
    t.integer  "application_rating_id"
    t.integer  "application_status_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "name"
    t.integer  "page_template_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "approve_comments"
    t.boolean  "reverse_comments"
    t.boolean  "reverse_posts"
    t.boolean  "truncate_posts"
  end

  create_table "check_boxes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.boolean  "approved"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "drop_downs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enquiries", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "field_options", :force => true do |t|
    t.string   "value"
    t.integer  "field_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "type"
    t.integer  "position"
    t.string   "default_value"
    t.integer  "number_of_selections"
    t.boolean  "required"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "form_id"
  end

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "form_submission_fields", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "field_id"
    t.integer  "form_submission_id"
  end

  create_table "form_submissions", :force => true do |t|
    t.boolean  "viewed",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "form_id"
  end

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "notification_address"
    t.boolean  "send_notification"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "submission_message"
    t.string   "submit_button"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menu_items", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "menu_id"
    t.integer  "link_id"
    t.integer  "position"
    t.integer  "folder_id"
    t.string   "override_link"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page_templates", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.text     "header_content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_template_id"
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "filename"
    t.integer  "folder_id"
    t.integer  "site_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "version"
    t.integer  "page_id"
  end

  create_table "pages", :force => true do |t|
    t.integer  "page_template_id"
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "filename"
    t.integer  "folder_id"
    t.integer  "site_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "version",          :default => 1
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "album_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "rotation"
    t.string   "link"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "blog_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "radio_groups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "contact_address"
    t.integer  "start_page_id"
    t.integer  "default_template_id"
    t.string   "global_title"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "text_fields", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "last_logged_in_at"
  end

end
