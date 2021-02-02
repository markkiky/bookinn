class BookingOrderDetail < ApplicationRecord
    validates :stay_start_date, presence: true
    validates :stay_end_date, presence: true
    validates :total_applicants, presence: true
end
