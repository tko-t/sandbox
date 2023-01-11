# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_23_075045) do
  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "slug", null: false, comment: "friendly_id"
    t.string "email", null: false, comment: "メールアドレス形式のアカウント"
    t.string "password_digest", null: false, comment: "ハッシュ化したパスワード"
    t.boolean "confirmed", default: false, null: false, comment: "本登録完了でtrue"
    t.string "state", default: "enabled", null: false, comment: "状態: enabled[有効] | disable[無効]"
    t.string "onetime_token", comment: "一時トークン(本登録・パスワード変更などでの利用を想定)"
    t.boolean "admin", default: false, null: false, comment: "管理者アカウントはtrue"
    t.datetime "last_login_at", comment: "最終ログイン日時"
    t.datetime "activated_at", comment: "本登録した日時"
    t.datetime "locked_at", comment: "ロックした日時"
    t.datetime "disabled_at", comment: "無効にした日時"
    t.integer "lock_version", comment: "楽観ロック用"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "accounts_email", unique: true
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.string "zip", null: false
    t.integer "country_id", null: false
    t.integer "city_id", null: false
    t.string "address", null: false
    t.virtual "full_name", type: :string, as: "concat(`first_name`,_utf8mb4' ',`last_name`)", stored: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_id_of_profile_history"
    t.index ["country_id"], name: "index_country_id_of_profile_history"
    t.index ["first_name", "last_name"], name: "index_name_of_profile_history"
    t.index ["full_name"], name: "index_full_name_of_profile_history"
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.string "zip", null: false
    t.integer "country_id", null: false
    t.integer "city_id", null: false
    t.string "address", null: false
    t.virtual "full_name", type: :string, as: "concat(`first_name`,_utf8mb4' ',`last_name`)", stored: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_id_of_profile"
    t.index ["country_id"], name: "index_country_id_of_profile"
    t.index ["first_name", "last_name"], name: "index_name_of_profile"
    t.index ["full_name"], name: "index_full_name_of_profile"
  end

end
