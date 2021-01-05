# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Channel.create(channel_id: Channel.channel_id, channel_description: "Agent", channel_status: "2")
Customer.create(customer_no: Customer.customer_no, customer_id: Customer.customer_id, customer_type_id: '1', country_id: "1", names: "Channel Booker", email: "channel@gmail.com", phone: "254714420943", address: "626 Muranga", postal_code: "10200", customer_status: "25", customer_status_date: "30-01-2020", last_visit: "20-12-2020", last_invoice: "20-12-2020", last_receipt: "20-12-2020", created_by: "1", updated_by: "1", is_channel: "1", channel_id: "1")
Customer.create(customer_no: Customer.customer_no, customer_id: Customer.customer_id, customer_type_id: '2', country_id: "113", names: "Mark Kariuki", email: "markkaris438@gmail.com", phone: "254714420943", address: "626 Muranga", postal_code: "10200", customer_status: "25", customer_status_date: "30-01-2020", last_visit: "20-12-2020", last_invoice: "20-12-2020", last_receipt: "20-12-2020", created_by: "1", updated_by: "1")
CustomerType.create(customer_type_id: CustomerType.customer_type_id, customer_type_description: "Channel")
CustomerType.create(customer_type_id: CustomerType.customer_type_id ,customer_type_description: "Adult")


RoomType.create(room_type_id: "1", room_type_description: "Deluxe Room", room_type_total: "2", created_by: "1", updated_by: "1", room_type_status: "1", room_price: "20000")
RoomType.create(room_type_id: "2", room_type_description: "Standard Room", room_type_total: "2", created_by: "1", updated_by: "1", room_type_status: "1", room_price: "5000")
RoomType.create(room_type_id: "3", room_type_description: "Single Room", room_type_total: "10", created_by: "1", updated_by: "1", room_type_status: "1", room_price: "10000")
RoomType.create(room_type_id: "3", room_type_description: "Double Room", room_type_total: "5", created_by: "1", updated_by: "1", room_type_status: "1", room_price: "15000")

Hotel.create(hotel_id: Hotel.hotel_id, hotel_name: "Hill Park", hotel_email: "hotel@email.com", hotel_contact_person: "Melvin", hotel_mobile: "0722654789", hotel_type_id: "2", parent_hotel_id: "2", hotel_status: "204")
# Deluxe Rooms
Room.create(room_id: "1", room_no: "B22", room_name: "Kiboko House", room_type_id: "3", room_price: "20000", capacity: "1", status: '1', hotel_id: "1" )
Room.create(room_id: "2", room_no: "A21", room_name: "Mwiko House", room_type_id: "1", room_price: "10000", capacity: "10", status: '1', hotel_id: "1" )
# Standard Rooms
Room.create(room_id: "3", room_no: "G01", room_name: "Simba Hut", room_type_id: "4", room_price: "2000",  capacity: "2", status: '1', hotel_id: "1" )
Room.create(room_id: "4", room_no: "G02", room_name: "Membly  Court", room_type_id: "2", room_price: "40000", capacity: "4", status: '1', hotel_id: "1" )


Status.create(status_id: "1", status_cluster_id: "1", status_description: "available")
Status.create(status_id: "2", status_cluster_id: "1", status_description: "occupied")
Status.create(status_id: "3", status_cluster_id: "1", status_description: "booked")
Status.create(status_id: "4", status_cluster_id: "1", status_description: "maintainance")
Status.create(status_id: "5", status_cluster_id: "1", status_description: "unavailable")


Status.create(status_id: "6", status_cluster_id: "2", status_description: "booked" )
Status.create(status_id: "7", status_cluster_id: "2", status_description: "cancelled" )
Status.create(status_id: "8", status_cluster_id: "2", status_description: "transfered" )
Status.create(status_id: "9", status_cluster_id: "2", status_description: "checked_in" )
Status.create(status_id: "10", status_cluster_id: "2", status_description: "checked_out" )

Status.create(status_id: '11', status_cluster_id: "3", status_description: "need")
Status.create(status_id: '12', status_cluster_id: "3", status_description: "preference")

Status.create(status_id: "13", status_cluster_id: "4", status_description: "pending")
Status.create(status_id: "14", status_cluster_id: "4", status_description: "resolved")

Status.create(status_id: "15", status_cluster_id: "5", status_description: "unpaid")
Status.create(status_id: "16", status_cluster_id: "5", status_description: "partial")
Status.create(status_id: "17", status_cluster_id: "5", status_description: "paid")
Status.create(status_id: "18", status_cluster_id: "5", status_description: "overpaid")
Status.create(status_id: "19", status_cluster_id: "5", status_description: "cancelled")

StatusCluster.create(status_cluster_id: "1", cluster_description: "Room Occupation status")
StatusCluster.create(status_cluster_id: "2", cluster_description: "Booking Order status")
StatusCluster.create(status_cluster_id: "3", cluster_description: "Need Type status")
StatusCluster.create(status_cluster_id: "4", cluster_description: "Ticket status")
StatusCluster.create(status_cluster_id: "5", cluster_description: "Bills status")

BookingOrder.create(booking_order_id: "1", booking_order_date: "21-01-2020", total_applicants: "1",  room_type_id: "1", stay_start_date: "01-11-2020", stay_end_date: "31-01-2021", booking_order_status: "2", booking_order_type_id: "1", created_by: "1", updated_by: "1")
BookingOrder.create(booking_order_id: "2", booking_order_date: "26-11-2020", total_applicants: "10", room_type_id: "1", stay_start_date: "01-12-2020", stay_end_date: "05-01-2021", booking_order_status: "2", booking_order_type_id: "3", created_by: "1", updated_by: "1")

BookingOrderType.create(booking_order_type_id: "1", booking_order_type_description: "Self", booking_order_type_status: "2" )
BookingOrderType.create(booking_order_type_id: "2", booking_order_type_description: "Others", booking_order_type_status: "2" )
BookingOrderType.create(booking_order_type_id: "3", booking_order_type_description: "Company", booking_order_type_status: "2" )
BookingOrderType.create(booking_order_type_id: "4", booking_order_type_description: "Channel", booking_order_type_status: "2" )

NeedType.create(need_type_id: '1', need_description: "Rocking Chair", need_type_status: "11")
NeedType.create(need_type_id: '2', need_description: "Wheel Chair Accessible Parking", need_type_status: "11")
NeedType.create(need_type_id: '3', need_description: "Large Windows", need_type_status: "12")

Role.create(role_id: "1", role_description: "Admin", role_status: "1")
Role.create(role_id: "2", role_description: "Finance", role_status: "1")
Role.create(role_id: "3", role_description: "Front Office", role_status: "1")
Role.create(role_id: "4", role_description: "Maintainance", role_status: "1")


User.create(email: "too@nouveta.tech", password: "123456", username: "BT", role_id: "1", hotel_id: "1")
User.create(email: "mark@nouveta.tech", password: "123456", username: "MK", role_id: "1", hotel_id: "2")

PaymentMode.create(payment_mode_id: PaymentMode.payment_mode_id, payment_mode_description: "MPESA", payment_mode_status: "", created_by: "2")
PaymentMode.create(payment_mode_id: PaymentMode.payment_mode_id, payment_mode_description: "CARD", payment_mode_status: "", created_by: "2")
PaymentMode.create(payment_mode_id: PaymentMode.payment_mode_id, payment_mode_description: "AIRTEL", payment_mode_status: "", created_by: "2")