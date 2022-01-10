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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_10_080810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "active_poll_translations", id: :serial, force: :cascade do |t|
    t.integer "active_poll_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "active_polls", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "action"
    t.integer "actionable_id"
    t.string "actionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_notification_translations", id: :serial, force: :cascade do |t|
    t.integer "admin_notification_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "body"
  end

  create_table "admin_notifications", id: :serial, force: :cascade do |t|
    t.string "link"
    t.string "segment_recipient"
    t.integer "recipients_count"
    t.date "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrators", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "description"
  end

  create_table "ahoy_events", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "visit_id"
    t.integer "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.string "ip"
  end

  create_table "audits", id: :serial, force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
  end

  create_table "banner_sections", id: :serial, force: :cascade do |t|
    t.integer "banner_id"
    t.integer "web_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banner_translations", id: :serial, force: :cascade do |t|
    t.integer "banner_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.datetime "hidden_at"
  end

  create_table "banners", id: :serial, force: :cascade do |t|
    t.string "target_url"
    t.date "post_started_at"
    t.date "post_ended_at"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uploaded_image_file_name"
    t.string "uploaded_image_content_type"
    t.integer "uploaded_image_file_size"
    t.datetime "uploaded_image_updated_at"
    t.string "text_align", default: "left"
    t.string "text_color"
    t.text "background_color"
    t.text "font_color"
  end

  create_table "budget_administrators", id: :serial, force: :cascade do |t|
    t.integer "budget_id"
    t.integer "administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_ballot_lines", id: :serial, force: :cascade do |t|
    t.integer "ballot_id"
    t.integer "investment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "budget_id"
    t.integer "group_id"
    t.integer "heading_id"
  end

  create_table "budget_ballots", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ballot_lines_count", default: 0
    t.boolean "physical", default: false
    t.integer "poll_ballot_id"
  end

  create_table "budget_content_blocks", id: :serial, force: :cascade do |t|
    t.integer "heading_id"
    t.text "body"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_group_translations", id: :serial, force: :cascade do |t|
    t.integer "budget_group_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "budget_groups", id: :serial, force: :cascade do |t|
    t.integer "budget_id"
    t.string "slug"
    t.integer "max_votable_headings", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budget_heading_translations", id: :serial, force: :cascade do |t|
    t.integer "budget_heading_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "budget_headings", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.bigint "price"
    t.integer "territorial_scope"
    t.integer "population"
    t.string "slug"
    t.boolean "allow_custom_content", default: false
    t.text "latitude"
    t.text "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "max_ballot_lines", default: 1
  end

  create_table "budget_investment_districts", id: :serial, force: :cascade do |t|
    t.integer "investment_id"
    t.integer "district_id"
  end

  create_table "budget_investment_geozones", id: :serial, force: :cascade do |t|
    t.integer "investment_id"
    t.integer "geozone_id"
  end

  create_table "budget_investment_translations", id: :serial, force: :cascade do |t|
    t.integer "budget_investment_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.datetime "hidden_at"
  end

  create_table "budget_investments", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "administrator_id"
    t.string "external_url"
    t.bigint "price"
    t.string "feasibility", limit: 15, default: "undecided"
    t.text "price_explanation"
    t.text "unfeasibility_explanation"
    t.boolean "valuation_finished", default: false
    t.integer "valuator_assignments_count", default: 0
    t.bigint "price_first_year"
    t.string "duration"
    t.datetime "hidden_at"
    t.integer "cached_votes_up", default: 0
    t.integer "comments_count", default: 0
    t.integer "confidence_score", default: 0, null: false
    t.integer "physical_votes", default: 0
    t.tsvector "tsv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "heading_id"
    t.string "responsible_name"
    t.integer "budget_id"
    t.integer "group_id"
    t.boolean "selected", default: false
    t.string "location"
    t.string "organization_name"
    t.datetime "unfeasible_email_sent_at"
    t.integer "ballot_lines_count", default: 0
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.integer "previous_heading_id"
    t.integer "geozone_id"
    t.integer "district_id"
    t.boolean "winner", default: false
    t.boolean "incompatible", default: false
    t.integer "community_id"
    t.boolean "visible_to_valuators", default: false
    t.integer "valuator_group_assignments_count", default: 0
    t.string "execution_status", default: "0"
    t.datetime "confirmed_hide_at"
    t.datetime "ignored_flag_at"
    t.integer "flags_count", default: 0
    t.integer "original_heading_id"
  end

  create_table "budget_phase_translations", id: :serial, force: :cascade do |t|
    t.integer "budget_phase_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "summary"
    t.string "name"
  end

  create_table "budget_phases", id: :serial, force: :cascade do |t|
    t.integer "budget_id"
    t.integer "next_phase_id"
    t.string "kind", null: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "enabled", default: true
  end

  create_table "budget_reclassified_votes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "investment_id"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_translations", id: :serial, force: :cascade do |t|
    t.integer "budget_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "budget_valuator_assignments", id: :serial, force: :cascade do |t|
    t.integer "valuator_id"
    t.integer "investment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_valuator_group_assignments", id: :serial, force: :cascade do |t|
    t.integer "valuator_group_id"
    t.integer "investment_id"
  end

  create_table "budget_valuators", id: :serial, force: :cascade do |t|
    t.integer "budget_id"
    t.integer "valuator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", id: :serial, force: :cascade do |t|
    t.string "currency_symbol", limit: 10
    t.string "phase", limit: 40, default: "accepting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description_accepting"
    t.text "description_reviewing"
    t.text "description_selecting"
    t.text "description_valuating"
    t.text "description_balloting"
    t.text "description_reviewing_ballots"
    t.text "description_finished"
    t.string "slug"
    t.text "description_drafting"
    t.text "description_publishing_prices"
    t.text "description_informing"
    t.string "voting_style", default: "knapsack"
    t.boolean "published"
  end

  create_table "campaigns", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_translations", id: :serial, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.datetime "hidden_at"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "subject"
    t.integer "user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "hidden_at"
    t.integer "flags_count", default: 0
    t.datetime "ignored_flag_at"
    t.integer "moderator_id"
    t.integer "administrator_id"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.datetime "confirmed_hide_at"
    t.string "ancestry"
    t.integer "confidence_score", default: 0, null: false
    t.boolean "valuation", default: false
    t.boolean "commentary_hidden_by_user", default: false
  end

  create_table "communities", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_actions", id: :serial, force: :cascade do |t|
    t.string "title", limit: 80
    t.text "description"
    t.string "link"
    t.boolean "request_to_administrators", default: false
    t.integer "day_offset", default: 0
    t.integer "required_supports", default: 0
    t.integer "order", default: 0
    t.boolean "active", default: true
    t.datetime "hidden_at"
    t.integer "action_type", default: 0, null: false
    t.string "short_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "published_proposal", default: false
  end

  create_table "dashboard_administrator_tasks", id: :serial, force: :cascade do |t|
    t.string "source_type"
    t.integer "source_id"
    t.integer "user_id"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_executed_actions", id: :serial, force: :cascade do |t|
    t.integer "proposal_id"
    t.integer "action_id"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debate_translations", id: :serial, force: :cascade do |t|
    t.integer "debate_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.datetime "hidden_at"
  end

  create_table "debates", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "visit_id"
    t.datetime "hidden_at"
    t.integer "flags_count", default: 0
    t.datetime "ignored_flag_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "comments_count", default: 0
    t.datetime "confirmed_hide_at"
    t.integer "cached_anonymous_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.bigint "hot_score", default: 0
    t.integer "confidence_score", default: 0
    t.integer "geozone_id"
    t.tsvector "tsv"
    t.datetime "featured_at"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "direct_messages", id: :serial, force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.bigint "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer "user_id"
    t.integer "documentable_id"
    t.string "documentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  create_table "failed_census_calls", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "document_number"
    t.string "document_type"
    t.date "date_of_birth"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "district_code"
    t.integer "poll_officer_id"
    t.integer "year_of_birth"
  end

  create_table "flags", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "flaggable_type"
    t.integer "flaggable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "followable_id"
    t.string "followable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geozones", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "html_map_coordinates"
    t.string "external_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "census_code"
  end

  create_table "geozones_polls", id: :serial, force: :cascade do |t|
    t.integer "geozone_id"
    t.integer "poll_id"
  end

  create_table "i18n_content_translations", id: :serial, force: :cascade do |t|
    t.integer "i18n_content_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "value"
  end

  create_table "i18n_contents", id: :serial, force: :cascade do |t|
    t.string "key"
  end

  create_table "identities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.integer "imageable_id"
    t.string "imageable_type"
    t.string "title", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.bigint "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer "user_id"
  end

  create_table "legislation_annotations", id: :serial, force: :cascade do |t|
    t.string "quote"
    t.text "ranges"
    t.text "text"
    t.integer "legislation_draft_version_id"
    t.integer "author_id"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.string "range_start"
    t.integer "range_start_offset"
    t.string "range_end"
    t.integer "range_end_offset"
    t.text "context"
  end

  create_table "legislation_answers", id: :serial, force: :cascade do |t|
    t.integer "legislation_question_id"
    t.integer "legislation_question_option_id"
    t.integer "user_id"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislation_draft_version_translations", id: :serial, force: :cascade do |t|
    t.integer "legislation_draft_version_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "changelog"
    t.text "body"
    t.datetime "hidden_at"
  end

  create_table "legislation_draft_versions", id: :serial, force: :cascade do |t|
    t.integer "legislation_process_id"
    t.string "status", default: "draft"
    t.boolean "final_version", default: false
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislation_process_translations", id: :serial, force: :cascade do |t|
    t.integer "legislation_process_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "summary"
    t.text "description"
    t.text "additional_info"
    t.text "milestones_summary"
    t.text "homepage"
    t.datetime "hidden_at"
  end

  create_table "legislation_processes", id: :serial, force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.date "debate_start_date"
    t.date "debate_end_date"
    t.date "draft_publication_date"
    t.date "allegations_start_date"
    t.date "allegations_end_date"
    t.date "result_publication_date"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "debate_phase_enabled", default: false
    t.boolean "allegations_phase_enabled", default: false
    t.boolean "draft_publication_enabled", default: false
    t.boolean "result_publication_enabled", default: false
    t.boolean "published", default: true
    t.date "proposals_phase_start_date"
    t.date "proposals_phase_end_date"
    t.boolean "proposals_phase_enabled"
    t.text "proposals_description"
    t.date "draft_start_date"
    t.date "draft_end_date"
    t.boolean "draft_phase_enabled", default: false
    t.boolean "homepage_enabled", default: false
    t.text "background_color"
    t.text "font_color"
    t.tsvector "tsv"
  end

  create_table "legislation_proposals", id: :serial, force: :cascade do |t|
    t.integer "legislation_process_id"
    t.string "title", limit: 80
    t.text "description"
    t.integer "author_id"
    t.datetime "hidden_at"
    t.integer "flags_count", default: 0
    t.datetime "ignored_flag_at"
    t.integer "cached_votes_up", default: 0
    t.integer "comments_count", default: 0
    t.datetime "confirmed_hide_at"
    t.bigint "hot_score", default: 0
    t.integer "confidence_score", default: 0
    t.string "responsible_name", limit: 60
    t.text "summary"
    t.string "video_url"
    t.tsvector "tsv"
    t.integer "geozone_id"
    t.datetime "retired_at"
    t.string "retired_reason"
    t.text "retired_explanation"
    t.integer "community_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_down", default: 0
    t.boolean "selected"
    t.integer "cached_votes_score", default: 0
  end

  create_table "legislation_question_option_translations", id: :serial, force: :cascade do |t|
    t.integer "legislation_question_option_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.datetime "hidden_at"
  end

  create_table "legislation_question_options", id: :serial, force: :cascade do |t|
    t.integer "legislation_question_id"
    t.integer "answers_count", default: 0
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislation_question_translations", id: :serial, force: :cascade do |t|
    t.integer "legislation_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.datetime "hidden_at"
  end

  create_table "legislation_questions", id: :serial, force: :cascade do |t|
    t.integer "legislation_process_id"
    t.integer "answers_count", default: 0
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.integer "author_id"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "label"
    t.string "url"
    t.string "linkable_type"
    t.integer "linkable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_census_records", id: :serial, force: :cascade do |t|
    t.string "document_number", null: false
    t.string "document_type", null: false
    t.date "date_of_birth", null: false
    t.string "postal_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "tries", default: 0
    t.datetime "locked_until", default: "2000-01-01 01:01:01", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "map_locations", id: :serial, force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.integer "zoom"
    t.integer "proposal_id"
    t.integer "investment_id"
  end

  create_table "milestone_statuses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milestone_translations", id: :serial, force: :cascade do |t|
    t.integer "milestone_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
  end

  create_table "milestones", id: :serial, force: :cascade do |t|
    t.integer "milestoneable_id"
    t.string "milestoneable_type"
    t.datetime "publication_date"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderators", id: :serial, force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "newsletters", id: :serial, force: :cascade do |t|
    t.string "subject"
    t.string "segment_recipient", null: false
    t.string "from"
    t.text "body"
    t.date "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.datetime "hidden_at"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.integer "counter", default: 1
    t.datetime "emailed_at"
    t.datetime "read_at"
  end

  create_table "organizations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 60
    t.datetime "verified_at"
    t.datetime "rejected_at"
    t.string "responsible_name", limit: 60
  end

  create_table "poll_answers", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.integer "author_id"
    t.string "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_ballot_sheets", id: :serial, force: :cascade do |t|
    t.text "data"
    t.integer "poll_id"
    t.integer "officer_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poll_ballots", id: :serial, force: :cascade do |t|
    t.integer "ballot_sheet_id"
    t.text "data"
    t.integer "external_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poll_booth_assignments", id: :serial, force: :cascade do |t|
    t.integer "booth_id"
    t.integer "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poll_booths", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "poll_officer_assignments", id: :serial, force: :cascade do |t|
    t.integer "booth_assignment_id"
    t.integer "officer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.boolean "final", default: false
    t.string "user_data_log", default: ""
  end

  create_table "poll_officers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "failed_census_calls_count", default: 0
  end

  create_table "poll_partial_results", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.integer "author_id"
    t.string "answer"
    t.integer "amount"
    t.string "origin"
    t.date "date"
    t.integer "booth_assignment_id"
    t.integer "officer_assignment_id"
    t.text "amount_log", default: ""
    t.text "officer_assignment_id_log", default: ""
    t.text "author_id_log", default: ""
  end

  create_table "poll_question_answer_translations", id: :serial, force: :cascade do |t|
    t.integer "poll_question_answer_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
  end

  create_table "poll_question_answer_videos", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "answer_id"
  end

  create_table "poll_question_answers", id: :serial, force: :cascade do |t|
    t.integer "question_id"
    t.integer "given_order", default: 1
    t.boolean "most_voted", default: false
  end

  create_table "poll_question_translations", id: :serial, force: :cascade do |t|
    t.integer "poll_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.datetime "hidden_at"
  end

  create_table "poll_questions", id: :serial, force: :cascade do |t|
    t.integer "proposal_id"
    t.integer "poll_id"
    t.integer "author_id"
    t.string "author_visible_name"
    t.integer "comments_count"
    t.datetime "hidden_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "tsv"
    t.string "video_url"
  end

  create_table "poll_recounts", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.string "origin"
    t.date "date"
    t.integer "booth_assignment_id"
    t.integer "officer_assignment_id"
    t.text "officer_assignment_id_log", default: ""
    t.text "author_id_log", default: ""
    t.integer "white_amount", default: 0
    t.text "white_amount_log", default: ""
    t.integer "null_amount", default: 0
    t.text "null_amount_log", default: ""
    t.integer "total_amount", default: 0
    t.text "total_amount_log", default: ""
  end

  create_table "poll_shifts", id: :serial, force: :cascade do |t|
    t.integer "booth_id"
    t.integer "officer_id"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "officer_name"
    t.string "officer_email"
    t.integer "task", default: 0, null: false
  end

  create_table "poll_translations", id: :serial, force: :cascade do |t|
    t.integer "poll_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "summary"
    t.text "description"
    t.datetime "hidden_at"
  end

  create_table "poll_voters", id: :serial, force: :cascade do |t|
    t.string "document_number"
    t.string "document_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "poll_id", null: false
    t.integer "booth_assignment_id"
    t.integer "age"
    t.string "gender"
    t.integer "geozone_id"
    t.integer "answer_id"
    t.integer "officer_assignment_id"
    t.integer "user_id"
    t.string "origin"
    t.integer "officer_id"
    t.string "token"
  end

  create_table "polls", id: :serial, force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "published", default: false
    t.boolean "geozone_restricted", default: false
    t.integer "comments_count", default: 0
    t.integer "author_id"
    t.datetime "hidden_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.integer "budget_id"
    t.string "related_type"
    t.integer "related_id"
    t.tsvector "tsv"
    t.string "method", default: "simple", null: false
    t.integer "max_score"
    t.integer "max_answers"
  end

  create_table "progress_bar_translations", id: :serial, force: :cascade do |t|
    t.integer "progress_bar_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "progress_bars", id: :serial, force: :cascade do |t|
    t.integer "kind"
    t.integer "percentage"
    t.integer "progressable_id"
    t.string "progressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_notifications", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "author_id"
    t.integer "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "moderated", default: false
    t.datetime "hidden_at"
    t.datetime "ignored_at"
    t.datetime "confirmed_hide_at"
  end

  create_table "proposal_translations", id: :serial, force: :cascade do |t|
    t.integer "proposal_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.text "summary"
    t.text "retired_explanation"
    t.datetime "hidden_at"
  end

  create_table "proposals", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.datetime "hidden_at"
    t.integer "flags_count", default: 0
    t.datetime "ignored_flag_at"
    t.integer "cached_votes_up", default: 0
    t.integer "comments_count", default: 0
    t.datetime "confirmed_hide_at"
    t.bigint "hot_score", default: 0
    t.integer "confidence_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "responsible_name", limit: 60
    t.string "video_url"
    t.tsvector "tsv"
    t.integer "geozone_id"
    t.datetime "retired_at"
    t.string "retired_reason"
    t.integer "community_id"
    t.datetime "published_at"
    t.boolean "selected", default: false
  end

  create_table "related_content_scores", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "related_content_id"
    t.integer "value"
  end

  create_table "related_contents", id: :serial, force: :cascade do |t|
    t.integer "parent_relationable_id"
    t.string "parent_relationable_type"
    t.integer "child_relationable_id"
    t.string "child_relationable_type"
    t.integer "related_content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "hidden_at"
    t.integer "related_content_scores_count", default: 0
    t.integer "author_id"
  end

  create_table "remote_translations", id: :serial, force: :cascade do |t|
    t.string "locale"
    t.integer "remote_translatable_id"
    t.string "remote_translatable_type"
    t.text "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.boolean "stats"
    t.boolean "results"
    t.string "process_type"
    t.integer "process_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "advanced_stats"
  end

  create_table "sdg_goals", force: :cascade do |t|
    t.integer "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_local_target_translations", force: :cascade do |t|
    t.bigint "sdg_local_target_id", null: false
    t.string "locale", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_local_targets", force: :cascade do |t|
    t.bigint "target_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "goal_id"
  end

  create_table "sdg_managers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_phases", force: :cascade do |t|
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_relations", force: :cascade do |t|
    t.string "related_sdg_type"
    t.bigint "related_sdg_id"
    t.string "relatable_type"
    t.bigint "relatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_reviews", force: :cascade do |t|
    t.string "relatable_type"
    t.bigint "relatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sdg_targets", force: :cascade do |t|
    t.bigint "goal_id"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "key"
    t.string "value"
  end

  create_table "signature_sheets", id: :serial, force: :cascade do |t|
    t.integer "signable_id"
    t.string "signable_type"
    t.text "required_fields_to_verify"
    t.boolean "processed", default: false
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "finished", default: false
    t.string "title"
  end

  create_table "signatures", id: :serial, force: :cascade do |t|
    t.integer "signature_sheet_id"
    t.integer "user_id"
    t.string "document_number"
    t.boolean "verified", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date_of_birth"
    t.string "postal_code"
  end

  create_table "site_customization_content_blocks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "locale"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_customization_images", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_customization_page_form_answers", id: :serial, force: :cascade do |t|
    t.integer "input_id"
    t.text "value"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "available_answer_id"
    t.text "extra_value"
  end

  create_table "site_customization_page_form_available_answers", id: :serial, force: :cascade do |t|
    t.integer "input_id"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_customization_page_form_inputs", id: :serial, force: :cascade do |t|
    t.text "label"
    t.integer "input_type"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "other_answer", default: false
  end

  create_table "site_customization_page_forms", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_id"
    t.boolean "only_verified_users", default: false
    t.boolean "active", default: false
    t.boolean "only_registered_users", default: false
    t.datetime "init_time"
    t.datetime "end_time"
  end

  create_table "site_customization_page_translations", id: :serial, force: :cascade do |t|
    t.integer "site_customization_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "subtitle"
    t.text "content"
  end

  create_table "site_customization_pages", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.boolean "more_info_flag"
    t.boolean "print_content_flag"
    t.string "status", default: "draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content_sidebar"
    t.string "email"
    t.string "locale"
    t.boolean "hide_title", default: false
  end

  create_table "stats_versions", id: :serial, force: :cascade do |t|
    t.string "process_type"
    t.integer "process_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 160
    t.integer "taggings_count", default: 0
    t.integer "debates_count", default: 0
    t.integer "proposals_count", default: 0
    t.string "kind"
    t.integer "budget_investments_count", default: 0
    t.integer "legislation_proposals_count", default: 0
    t.integer "legislation_processes_count", default: 0
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "author_id"
    t.integer "comments_count", default: 0
    t.integer "community_id"
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweet_hashtags", id: :serial, force: :cascade do |t|
    t.integer "tweet_id"
    t.string "hashtag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweet_images", id: :serial, force: :cascade do |t|
    t.integer "tweet_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweet_urls", id: :serial, force: :cascade do |t|
    t.integer "tweet_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", id: :serial, force: :cascade do |t|
    t.text "body"
    t.text "html"
    t.bigint "code"
    t.string "user_name"
    t.string "user_alias"
    t.string "user_profile_image"
    t.string "user_profile_url"
    t.string "uri"
    t.date "publication_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "email_on_comment", default: false
    t.boolean "email_on_comment_reply", default: false
    t.string "phone_number", limit: 30
    t.string "official_position"
    t.integer "official_level", default: 0
    t.datetime "hidden_at"
    t.string "sms_confirmation_code"
    t.string "username", limit: 60
    t.string "document_number"
    t.string "document_type"
    t.datetime "residence_verified_at"
    t.string "email_verification_token"
    t.datetime "verified_at"
    t.string "unconfirmed_phone"
    t.string "confirmed_phone"
    t.datetime "letter_requested_at"
    t.datetime "confirmed_hide_at"
    t.string "letter_verification_code"
    t.integer "failed_census_calls_count", default: 0
    t.datetime "level_two_verified_at"
    t.string "erase_reason"
    t.datetime "erased_at"
    t.boolean "public_activity", default: false
    t.boolean "newsletter", default: false
    t.integer "notifications_count", default: 0
    t.boolean "registering_with_oauth", default: false
    t.string "locale"
    t.string "oauth_email"
    t.integer "geozone_id"
    t.string "redeemable_code"
    t.string "gender", limit: 10
    t.datetime "date_of_birth"
    t.boolean "email_on_proposal_notification", default: true
    t.boolean "email_digest", default: false
    t.boolean "email_on_direct_message", default: false
    t.boolean "official_position_badge", default: false
    t.datetime "password_changed_at", default: "2015-01-01 01:01:01", null: false
    t.boolean "created_from_signature", default: false
    t.integer "failed_email_digests_count", default: 0
    t.text "former_users_data_log", default: ""
    t.boolean "public_interests", default: false
    t.boolean "without_email", default: false
    t.datetime "checked_at"
    t.string "checked_log"
    t.boolean "privacy", default: true
    t.string "newsletter_locale", default: "ca"
    t.boolean "recommended_debates", default: true
    t.boolean "recommended_proposals", default: true
    t.integer "balloted_heading_id"
  end

  create_table "valuator_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "budget_investments_count", default: 0
  end

  create_table "valuators", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "description"
    t.integer "budget_investments_count", default: 0
    t.integer "valuator_group_id"
    t.boolean "can_comment", default: true
    t.boolean "can_edit_dossier", default: true
  end

  create_table "verified_users", id: :serial, force: :cascade do |t|
    t.string "document_number"
    t.string "document_type"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "visitor_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.text "landing_page"
    t.integer "user_id"
    t.string "referring_domain"
    t.string "search_keyword"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.integer "screen_height"
    t.integer "screen_width"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "postal_code"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "votable_id"
    t.string "votable_type"
    t.integer "voter_id"
    t.string "voter_type"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "signature_id"
  end

  create_table "web_sections", id: :serial, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widget_card_translations", id: :serial, force: :cascade do |t|
    t.integer "widget_card_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.string "title"
    t.text "description"
    t.string "link_text"
  end

  create_table "widget_cards", id: :serial, force: :cascade do |t|
    t.string "link_url"
    t.boolean "header", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cardable_id"
    t.integer "columns", default: 4
    t.string "cardable_type", default: "SiteCustomization::Page"
  end

  create_table "widget_feeds", id: :serial, force: :cascade do |t|
    t.string "kind"
    t.integer "limit", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "administrators", "users", name: "administrators_user_id_fkey"
  add_foreign_key "budget_administrators", "administrators", name: "budget_administrators_administrator_id_fkey"
  add_foreign_key "budget_administrators", "budgets", name: "budget_administrators_budget_id_fkey"
  add_foreign_key "budget_investments", "communities", name: "budget_investments_community_id_fkey"
  add_foreign_key "budget_investments", "geozones", name: "budget_investments_geozone_id_fkey"
  add_foreign_key "budget_valuators", "budgets", name: "budget_valuators_budget_id_fkey"
  add_foreign_key "budget_valuators", "valuators", name: "budget_valuators_valuator_id_fkey"
  add_foreign_key "dashboard_administrator_tasks", "users", name: "dashboard_administrator_tasks_user_id_fkey"
  add_foreign_key "dashboard_executed_actions", "dashboard_actions", column: "action_id", name: "dashboard_executed_actions_action_id_fkey"
  add_foreign_key "dashboard_executed_actions", "proposals", name: "dashboard_executed_actions_proposal_id_fkey"
  add_foreign_key "documents", "users", name: "documents_user_id_fkey"
  add_foreign_key "failed_census_calls", "poll_officers", name: "failed_census_calls_poll_officer_id_fkey"
  add_foreign_key "failed_census_calls", "users", name: "failed_census_calls_user_id_fkey"
  add_foreign_key "flags", "users", name: "flags_user_id_fkey"
  add_foreign_key "follows", "users", name: "follows_user_id_fkey"
  add_foreign_key "geozones_polls", "geozones", name: "geozones_polls_geozone_id_fkey"
  add_foreign_key "geozones_polls", "polls", name: "geozones_polls_poll_id_fkey"
  add_foreign_key "identities", "users", name: "identities_user_id_fkey"
  add_foreign_key "images", "users", name: "images_user_id_fkey"
  add_foreign_key "legislation_draft_versions", "legislation_processes", name: "legislation_draft_versions_legislation_process_id_fkey"
  add_foreign_key "legislation_proposals", "legislation_processes", name: "legislation_proposals_legislation_process_id_fkey"
  add_foreign_key "locks", "users", name: "locks_user_id_fkey"
  add_foreign_key "managers", "users", name: "managers_user_id_fkey"
  add_foreign_key "moderators", "users", name: "moderators_user_id_fkey"
  add_foreign_key "notifications", "users", name: "notifications_user_id_fkey"
  add_foreign_key "organizations", "users", name: "organizations_user_id_fkey"
  add_foreign_key "poll_answers", "poll_questions", column: "question_id", name: "poll_answers_question_id_fkey"
  add_foreign_key "poll_booth_assignments", "polls", name: "poll_booth_assignments_poll_id_fkey"
  add_foreign_key "poll_officer_assignments", "poll_booth_assignments", column: "booth_assignment_id", name: "poll_officer_assignments_booth_assignment_id_fkey"
  add_foreign_key "poll_partial_results", "poll_booth_assignments", column: "booth_assignment_id", name: "poll_partial_results_booth_assignment_id_fkey"
  add_foreign_key "poll_partial_results", "poll_officer_assignments", column: "officer_assignment_id", name: "poll_partial_results_officer_assignment_id_fkey"
  add_foreign_key "poll_partial_results", "poll_questions", column: "question_id", name: "poll_partial_results_question_id_fkey"
  add_foreign_key "poll_partial_results", "users", column: "author_id", name: "poll_partial_results_author_id_fkey"
  add_foreign_key "poll_question_answer_videos", "poll_question_answers", column: "answer_id", name: "poll_question_answer_videos_answer_id_fkey"
  add_foreign_key "poll_question_answers", "poll_questions", column: "question_id", name: "poll_question_answers_question_id_fkey"
  add_foreign_key "poll_questions", "polls", name: "poll_questions_poll_id_fkey"
  add_foreign_key "poll_questions", "proposals", name: "poll_questions_proposal_id_fkey"
  add_foreign_key "poll_questions", "users", column: "author_id", name: "poll_questions_author_id_fkey"
  add_foreign_key "poll_recounts", "poll_booth_assignments", column: "booth_assignment_id", name: "poll_recounts_booth_assignment_id_fkey"
  add_foreign_key "poll_recounts", "poll_officer_assignments", column: "officer_assignment_id", name: "poll_recounts_officer_assignment_id_fkey"
  add_foreign_key "poll_voters", "polls", name: "poll_voters_poll_id_fkey"
  add_foreign_key "polls", "budgets", name: "polls_budget_id_fkey"
  add_foreign_key "proposals", "communities", name: "proposals_community_id_fkey"
  add_foreign_key "related_content_scores", "related_contents", name: "related_content_scores_related_content_id_fkey"
  add_foreign_key "related_content_scores", "users", name: "related_content_scores_user_id_fkey"
  add_foreign_key "sdg_managers", "users", name: "sdg_managers_user_id_fkey"
  add_foreign_key "site_customization_page_form_answers", "users", name: "site_customization_page_form_answers_user_id_fkey"
  add_foreign_key "tweet_hashtags", "tweets", name: "tweet_hashtags_tweet_id_fkey"
  add_foreign_key "tweet_images", "tweets", name: "tweet_images_tweet_id_fkey"
  add_foreign_key "tweet_urls", "tweets", name: "tweet_urls_tweet_id_fkey"
  add_foreign_key "users", "geozones", name: "users_geozone_id_fkey"
  add_foreign_key "valuators", "users", name: "valuators_user_id_fkey"
end
