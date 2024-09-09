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

ActiveRecord::Schema[7.1].define(version: 2024_09_09_081019) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.date "fecha_nacimiento"
    t.string "tipo_documento"
    t.string "numero_documento"
    t.string "direccion"
    t.string "ciudad"
    t.string "telefono"
    t.string "estado_civil"
    t.string "sexo"
    t.string "raza"
    t.string "tipo_sangre"
    t.string "ocupacion"
    t.string "eps"
    t.string "alergias"
    t.string "cirugias"
    t.string "emergency_nombre"
    t.string "emergency_direccion"
    t.string "emergency_ciudad"
    t.string "emergency_telefono"
    t.string "emergency_relacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xrays", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
