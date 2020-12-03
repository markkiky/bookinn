class Room < ApplicationRecord

    # returns a room type object
    def self.room_type(room_id)
        # @room_type = []
        @room = Room.find(room_id)
        @room_type = RoomType.find_by(id: @room.room_type_id)

        return @room_type
    end

    # returns a room status object with cluster joined
    def self.room_status(room_id)
        @room = Room.find(room_id)

        @status = Status.find_by(id: @room.status)
        @status_cluster = StatusCluster.find_by(id: @status.status_cluster_id)
        # byebug
        # design response object with both status and cluster
        @room_status = {
            status_id: @status.id,
            status_description: @status.status_description,
            status_cluster_id: @status_cluster.id,
            status_cluster_description: @status_cluster.cluster_description
        }
        return @room_status

    end

    def self.room_occupancy(room_id)
        @customer_bookings = CustomerBooking.where(:room_id => room_id, :is_active => 1)
        # byebug
        # Find the most recent booking for the room
        @booking_order = BookingOrder.find_by(id:  @customer_bookings.last.booking_order_id)
        
        if @customer_bookings
            @booking_order = BookingOrder.find_by(id:  @customer_bookings.last.booking_order_id)
            @dates = {
                stay_start_date: @booking_order.stay_start_date,
                stay_end_date: @booking_order.stay_end_date
            }
            # @dates << @date
        else
            @dates 
        end
        return @dates
        # @booking_orders = BookingOrder.all.where(:is_active => 1)
        # @customer_rooms = CustomerRoom.where(:room_id => room_id)
        # byebug
        # CustomerRoom.where()
    end
end
