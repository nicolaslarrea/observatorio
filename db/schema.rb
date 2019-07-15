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

ActiveRecord::Schema.define(version: 2019_07_12_202505) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "carreras", force: :cascade do |t|
    t.string "nombre"
    t.string "abreviatura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catedras", force: :cascade do |t|
    t.integer "materia_id"
    t.integer "numero"
    t.integer "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["materia_id"], name: "index_catedras_on_materia_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.integer "oferta_en_lista_id"
    t.integer "docente_id"
    t.string "tipo"
    t.string "numero"
    t.string "dia"
    t.string "inicio"
    t.string "fin"
    t.string "obligatorio"
    t.string "aula"
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["docente_id"], name: "index_cursos_on_docente_id"
    t.index ["oferta_en_lista_id"], name: "index_cursos_on_oferta_en_lista_id"
  end

  create_table "docentes", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscripciones", force: :cascade do |t|
    t.integer "ano"
    t.integer "cuatrimestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materias", force: :cascade do |t|
    t.string "nombre"
    t.integer "carrera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_materias_on_carrera_id"
  end

  create_table "oferta_en_listas", force: :cascade do |t|
    t.integer "inscripcion_id"
    t.integer "catedra_id"
    t.integer "titular_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catedra_id"], name: "index_oferta_en_listas_on_catedra_id"
    t.index ["inscripcion_id"], name: "index_oferta_en_listas_on_inscripcion_id"
    t.index ["titular_id"], name: "index_oferta_en_listas_on_titular_id"
  end

  create_table "titulares", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacantes", force: :cascade do |t|
    t.integer "curso_id"
    t.integer "numero"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_vacantes_on_curso_id"
  end

end
