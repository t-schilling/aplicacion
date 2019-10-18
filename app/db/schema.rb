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

ActiveRecord::Schema.define(version: 2019_10_18_073109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comentariors", force: :cascade do |t|
    t.text "contenido"
    t.integer "valoracion"
    t.bigint "restaurant_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_comentariors_on_restaurant_id"
    t.index ["user_id"], name: "index_comentariors_on_user_id"
  end

  create_table "ordens", force: :cascade do |t|
    t.string "nombreplato"
    t.float "precio"
    t.string "pago"
    t.string "direccion"
    t.datetime "llegada"
    t.string "estado"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.bigint "plato_id"
    t.bigint "user_id"
    t.index ["plato_id"], name: "index_ordens_on_plato_id"
    t.index ["restaurant_id"], name: "index_ordens_on_restaurant_id"
    t.index ["user_id"], name: "index_ordens_on_user_id"
  end

  create_table "platos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.text "descripcion"
    t.integer "cantidad_personas"
    t.string "imagen"
    t.integer "valoracion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_platos_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "nombre"
    t.string "correo"
    t.string "direccion"
    t.integer "valoracion"
    t.string "imagen"
    t.string "numero_telefonico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nombre"], name: "index_users_on_nombre", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comentariors", "restaurants"
  add_foreign_key "comentariors", "users"
  add_foreign_key "ordens", "platos"
  add_foreign_key "ordens", "restaurants"
  add_foreign_key "ordens", "users"
  add_foreign_key "platos", "restaurants"
end
