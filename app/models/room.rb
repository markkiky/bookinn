class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type
  has_many :room_assignments
  has_many :customers, through: :room_assignments

  # returns a room type object
  def self.room_type(room_id)
    # @room_type = []
    @room = Room.find(room_id)
    @room_type = RoomType.find_by(id: @room.room_type_id)

    return @room_type
  end

  # check if room is available
  # room is available if
  # status is available
  # status is assigned/occupied but capacity not reached
  # returns true or false
  def self.room_available(room_id)
    begin
      @room = Room.find(room_id)
      @room_type = RoomType.find(room_id)

      # check room availability
      if @room.status == "1"
        # room status is available return true
        puts "Room is available"
        return true
      elsif @room.status == "2"
        # room status is occupied, check if the room capacity is reached
        @room_assignments = RoomAssignment.all.where(:room_id => room_id, :is_active => 1)
        if @room_assignments.count < @room.capacity.to_i
          # room can still be assigned to another customer
          puts "Room is not full"
          return true
        elsif @room_assignments.count > @room.capacity.to_i
          # room is already full
          puts "Room is already full"
          return false
        elsif @room_assignments.count == @room.capacity.to_i
          # room is full
          puts "Room is full"
          return false
        else
          # unexpected state return false
          puts "Unexpected state"
          return false
        end
      else
        puts "Room status not occupied or available"
        return false
      end
    rescue 
        # return "Room with that Id not found"
    end
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
      status_cluster_description: @status_cluster.cluster_description,
    }
    return @room_status
  end

  def self.room_occupancy(room_id)
    # @customer_bookings = CustomerBooking.where(:room_id => room_id, :is_active => 1)
    @room_assignments = RoomAssignment.where(:room_id => room_id)
    # byebug
    # Find the most recent booking for the room
    # @booking_order = BookingOrder.find_by(id:  @customer_bookings.last.booking_order_id)
    # byebug
    if @room_assignments.count > 0
      @booking_order = BookingOrder.find_by(id: @room_assignments.last.booking_order_id)
      @dates = {
        stay_start_date: @booking_order.stay_start_date,
        stay_end_date: @booking_order.stay_end_date,
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

  def self.rooms_by_status(status)
    @rooms = Room.where(status: status)

    return @rooms
  end
end
