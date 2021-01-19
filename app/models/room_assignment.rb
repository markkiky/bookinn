class RoomAssignment < ApplicationRecord
  belongs_to :customer
  belongs_to :room
    def self.room_assignment_id
        @customers = RoomAssignment.all
        if @customers.count > 0
          # customers present. continue count
          count = @customers.last.id
          count = count + 1
          series = count.to_s
          @customer_id = "#{series.rjust(3, "0")}"
          return @customer_id
        else
          # no customer present. initiate count
          count = "1"
          @customer_id = "#{count.rjust(3, "0")}"
          return @customer_id
        end
      end
end
