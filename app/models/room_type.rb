class RoomType < ApplicationRecord
    validates :room_price, presence: true
    belongs_to :bill_item
end
