# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_524_071_939) do
  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'articles_favourites', id: false, force: :cascade do |t|
    t.integer 'article_id', null: false
    t.integer 'favourite_id', null: false
  end

  create_table 'articles_shares', id: false, force: :cascade do |t|
    t.integer 'article_id', null: false
    t.integer 'share_id', null: false
  end

  create_table 'favourites', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'images', force: :cascade do |t|
    t.string 'name'
    t.string 'picture'
    t.integer 'article_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_images_on_article_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'article_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_likes_on_article_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'shares', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'titles', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'mail'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'role'
  end

  add_foreign_key 'images', 'articles'
  add_foreign_key 'likes', 'articles'
  add_foreign_key 'likes', 'users'
end
