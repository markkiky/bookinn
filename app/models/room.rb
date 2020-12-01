class Room < ApplicationRecord

    def self.room_type(room_id)
        # @room_type = []
        @room = Room.find(room_id)
        @room_type = RoomType.find_by(id: @room.room_type_id)

        return @room_type
    end
end
