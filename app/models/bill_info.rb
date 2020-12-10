class BillInfo < ApplicationRecord

    # return a unique bill no for bookinn system only
    def self.bill_no
        @bill_infos = BillInfo.all
        prefix = "BK"
        year = Date.today.year.to_s
        year = year.slice(2..3)

        month = Date.today.month.to_s
        month = month.ljust(2, "0")

        day = Date.today.day.to_s
        day = day.rjust(2, "0")

        # No present bills. Start new billings 
        if @bill_infos.count < 1
            series = "9999"
            bill_no = "#{prefix}#{year}#{day}-#{month}#{series.rjust(4, "0")}"
            return bill_no
        else
            series = @bill_infos.last.bill_no.split(//).last(4).join.to_i
            # @bill_infos.last
            series = series + 1
            serial = series.to_s
            bill_no = "#{prefix}#{year}#{day}-#{month}#{series.rjust(4, "0")}"

            return bill_no
        end
    end
end
