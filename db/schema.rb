# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_28_131718) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bill_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bill_detail_id"
    t.string "bill_no"
    t.string "bill_info_id"
    t.string "room_type_id"
    t.string "bill_detail_description"
    t.string "booking_order_detail_id"
    t.string "amount"
    t.string "bill_item_id"
    t.string "bill_item_quantity"
    t.string "bill_item_quantity2"
    t.string "bill_item_rate"
    t.string "bill_item_amount"
    t.string "bill_item_discount"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bill_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bill_no"
    t.datetime "bill_date"
    t.string "customer_id"
    t.string "booking_order_id"
    t.string "bill_info_description"
    t.string "bill_total"
    t.string "reducing_balance"
    t.string "bill_status", default: "15"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bill_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bill_item_id"
    t.string "unit_of_measure_id"
    t.string "bill_item_description"
    t.string "bill_item_rate"
    t.string "bill_item_quantity"
    t.string "bill_item_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "booking_order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "booking_order_id"
    t.string "room_type_id"
    t.datetime "stay_start_date"
    t.datetime "stay_end_date"
    t.string "total_applicants"
    t.string "amount"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "booking_order_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "booking_order_type_id"
    t.string "booking_order_type_description"
    t.string "booking_order_type_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "booking_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "booking_order_id"
    t.string "booking_order_date"
    t.string "customer_id"
    t.string "booking_no"
    t.string "total_applicants"
    t.string "room_type_id"
    t.datetime "stay_start_date"
    t.datetime "stay_end_date"
    t.string "discount"
    t.string "amount"
    t.string "booking_order_status", default: "6"
    t.string "booking_order_type_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "channel_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "channel_transaction_id"
    t.datetime "channel_transaction_date"
    t.string "channel_transaction_type"
    t.string "channel_transaction_amount"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "channel_id"
    t.string "channel_description"
    t.string "channel_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "iso3", limit: 3
    t.string "iso2", limit: 2
    t.string "phonecode"
    t.string "capital"
    t.string "currency"
    t.timestamp "created_at"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "flag", default: true, null: false
    t.string "wikiDataId", comment: "Rapid API GeoDB Cities"
    t.string "is_active", limit: 40, default: "1", null: false
    t.string "date", limit: 40
  end

  create_table "currencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "currency_id"
    t.string "currency_symbol"
    t.string "currency_name"
    t.string "country_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "currency_exchange_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "currency_exchange_rate_id"
    t.string "base_currency_id"
    t.string "secondary_currency_id"
    t.string "exchange_rate"
    t.string "start_date"
    t.string "end_date"
    t.string "exchange_rate_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_id"
    t.string "booking_order_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bill_info_id"
  end

  create_table "customer_needs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_id"
    t.string "need_type_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_id"
    t.string "room_id"
    t.string "status"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_type_id"
    t.string "customer_type_description"
    t.string "customer_type_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_no"
    t.string "customer_id"
    t.string "customer_type_id"
    t.string "country_id"
    t.string "names"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "postal_code"
    t.string "customer_status"
    t.string "id_no"
    t.datetime "customer_status_date"
    t.datetime "last_visit"
    t.datetime "last_invoice"
    t.datetime "last_receipt"
    t.string "is_channel", default: "0"
    t.string "channel_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "discount_id"
    t.string "amount"
    t.string "discount_rate"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotel_amenities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hotel_amenity_id"
    t.string "bill_item_id"
    t.string "hotel_amenity_name"
    t.string "hotel_amenity_description"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotel_wings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hotel_wing_id"
    t.string "wing_description"
    t.string "hotel_wing_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hotel_id"
    t.string "hotel_name"
    t.string "hotel_email"
    t.string "hotel_contact_person"
    t.string "hotel_mobile"
    t.string "hotel_type_id"
    t.string "parent_hotel_id", null: false
    t.string "hotel_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "id_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_document_no"
    t.string "id_document_type"
    t.string "id_document_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "laundries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "laundry_package_id"
    t.string "customer_id"
    t.string "booking_order_id"
    t.string "laundry_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "laundry_packages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "laundry_description"
    t.string "amount"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_code"
    t.string "token"
    t.string "username"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "need_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "need_type_id"
    t.string "need_description"
    t.string "need_type_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_modes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "payment_mode_id"
    t.string "payment_mode_description"
    t.string "payment_mode_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_transaction_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "payment_transaction_type_id"
    t.string "payment_transaction_type_description"
    t.string "payment_transaction_type_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "payment_transaction_id"
    t.string "booking_order_id"
    t.string "bill_no"
    t.datetime "payment_transaction_date"
    t.string "payment_transaction_type_id"
    t.string "payment_transaction_amount"
    t.string "payment_transaction_ref"
    t.string "payment_transaction_phone"
    t.string "payment_transaction_paybill"
    t.string "names"
    t.string "payment_mode_id"
    t.datetime "date_printed"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role_id"
    t.string "role_description"
    t.string "role_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_amenities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "room_amenity_id"
    t.string "room_type_id"
    t.string "bill_item_id"
    t.string "room_amenity_name"
    t.string "room_amenity_description"
    t.string "price"
    t.boolean "billable"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "room_assignment_id"
    t.string "customer_id"
    t.string "customer_names"
    t.string "booking_order_id"
    t.string "room_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "room_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "room_type_id"
    t.string "bill_item_id"
    t.string "room_type_description"
    t.string "room_type_status"
    t.string "room_type_total"
    t.string "room_price"
    t.string "bill_type"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hotel_id"
    t.string "room_id"
    t.string "room_no"
    t.string "room_name"
    t.string "room_type_id"
    t.string "room_price"
    t.string "capacity"
    t.string "status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "status_clusters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status_cluster_id"
    t.string "cluster_description"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status_id"
    t.string "status_cluster_id"
    t.string "status_description"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ticket_id"
    t.string "ticket_no"
    t.string "customer_id"
    t.string "ticket_description"
    t.string "ticket_date"
    t.string "ticket_status"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unit_of_measures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "unit_id"
    t.string "unit_description"
    t.string "unit_status"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_id"
    t.string "username"
    t.string "id_document_no"
    t.string "id_document_type"
    t.string "identification_no"
    t.string "user_department"
    t.string "user_type_id"
    t.string "user_status"
    t.string "email"
    t.string "password_digest"
    t.string "role_id"
    t.string "hotel_id"
    t.string "is_active", default: "1"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
