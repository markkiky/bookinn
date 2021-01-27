class RoomType < ApplicationRecord
    validates :room_price, presence: true
    belongs_to :bill_item
    has_many :room_amenities
end
