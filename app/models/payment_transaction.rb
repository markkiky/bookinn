class PaymentTransaction < ApplicationRecord
     # returns a valid customer id for new customers
     def self.payment_transaction_id
        @customers = PaymentTransaction.all
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
