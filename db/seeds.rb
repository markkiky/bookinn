# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create(customer_no: "254", customer_id: "1", customer_type_id: '1', country_id: "1", customer_names: "Mark Kariuki", customer_email: "markkaris438@gmail.com", customer_mobile: "254714420943", customer_address: "626 Muranga", customer_postcode: "10200", customer_status: "25", customer_status_date: "30-01-2020", last_visit: "20-12-2020", last_invoice: "20-12-2020", last_receipt: "20-12-2020", created_by: "1", updated_by: "1")

RoomType.create(room_type_id: "1", room_type_description: "Deluxe Room", room_type_total: "2", created_by: "1", updated_by: "1", room_type_status: "1")
RoomType.create(room_type_id: "2", room_type_description: "Standard Room", room_type_total: "5", created_by: "1", updated_by: "1", room_type_status: "1")

# Deluxe Rooms
Room.create(room_id: "1", room_no: "B22", room_name: "Kiboko House", room_type_id: "1", status: '1' )
Room.create(room_id: "1", room_no: "A21", room_name: "Mwiko House", room_type_id: "1", status: '1' )
# Standard Rooms
Room.create(room_id: "1", room_no: "G01", room_name: "Simba Hut", room_type_id: "2", status: '1' )
Room.create(room_id: "1", room_no: "G02", room_name: "Membly  Court", room_type_id: "2", status: '1' )


Status.create(status_id: "1", status_cluster_id: "1", status_description: "available")
Status.create(status_id: "2", status_cluster_id: "1", status_description: "occupied")
Status.create(status_id: "3", status_cluster_id: "1", status_description: "booked")
Status.create(status_id: "4", status_cluster_id: "1", status_description: "maintainance")
Status.create(status_id: "5", status_cluster_id: "1", status_description: "unavailable")

StatusCluster.create(status_cluster_id: "1", cluster_description: "Room Occupation status")
StatusCluster.create(status_cluster_id: "2", cluster_description: "Room Type status")
StatusCluster.create(status_cluster_id: "3", cluster_description: "Bookinn Order status")
StatusCluster.create(status_cluster_id: "4", cluster_description: "Bill status")