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

ActiveRecord::Schema.define(version: 20180122161235) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "システム管理ユーザ" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "faqs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "よくある質問" do |t|
    t.text "question"
    t.text "answer"
    t.integer "sort_order"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "感想フィードバック" do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_feedbacks_on_movie_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "movie_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "動画カテゴリ" do |t|
    t.bigint "service_id"
    t.string "name"
    t.boolean "must_view"
    t.integer "sort_order"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_movie_categories_on_service_id"
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "動画" do |t|
    t.bigint "movie_category_id"
    t.string "title"
    t.string "url"
    t.integer "sort_order"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_category_id"], name: "index_movies_on_movie_category_id"
  end

  create_table "service_manager_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "サービス運営者_権限マスタ" do |t|
    t.string "role_code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "サービス運営者" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "role_code"
    t.bigint "service_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_service_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_service_managers_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_service_managers_on_service_id"
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "サービス" do |t|
    t.string "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "一般ユーザ" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "line_id"
    t.bigint "service_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["line_id"], name: "index_users_on_line_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_users_on_service_id"
  end

  add_foreign_key "feedbacks", "movies"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "movie_categories", "services"
  add_foreign_key "movies", "movie_categories"
  add_foreign_key "service_managers", "services"
  add_foreign_key "users", "services"
end
