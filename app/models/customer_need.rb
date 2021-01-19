class CustomerNeed < ApplicationRecord
    belongs_to :customer
    belongs_to :need_type

    def self.make(customer_id, need_type_id)
        @customer_need = CustomerNeed.find_or_create_by(:customer_id => customer_id, :need_type_id => need_type_id)

        if @customer_need != nil
            return true
        elsif @customer_need == nil
            return false
        end
    end
end
