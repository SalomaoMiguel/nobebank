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

ActiveRecord::Schema.define(version: 2021_02_12_131312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencium", force: :cascade do |t|
    t.bigint "banco_id"
    t.string "codigo", null: false
    t.string "descricao", null: false
    t.string "numero", null: false
    t.boolean "ativo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banco_id"], name: "index_agencium_on_banco_id"
  end

  create_table "banco", force: :cascade do |t|
    t.string "nome", null: false
    t.string "codigo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banco_user", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "senha", null: false
    t.bigint "banco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banco_id"], name: "index_banco_user_on_banco_id"
  end

  create_table "cliente", force: :cascade do |t|
    t.string "nome", null: false
    t.date "dt_nascimento", null: false
    t.decimal "renda", default: "1.0", null: false
    t.string "cpf", null: false
    t.string "telefone"
    t.string "celular", null: false
    t.string "email", null: false
    t.string "senha", null: false
    t.boolean "ativo", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conta_movimento_tipo", force: :cascade do |t|
    t.string "codigo", null: false
    t.string "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conta_tipo", force: :cascade do |t|
    t.string "codigo", null: false
    t.string "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agencium", "banco"
  add_foreign_key "banco_user", "banco"
end
