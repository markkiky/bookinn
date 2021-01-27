class Report < ApplicationRecord
  def self.monthly_revenue
    @january = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 1, 1), Date.civil(Date.today.year, 1, -1)).sum(:payment_transaction_amount)
    @february = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 2, 1), Date.civil(Date.today.year, 2, -1)).sum(:payment_transaction_amount)
    @march = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 3, 1), Date.civil(Date.today.year, 3, -1)).sum(:payment_transaction_amount)
    @april = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 4, 1), Date.civil(Date.today.year, 4, -1)).sum(:payment_transaction_amount)
    @may = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 5, 1), Date.civil(Date.today.year, 5, -1)).sum(:payment_transaction_amount)
    @june = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 6, 1), Date.civil(Date.today.year, 6, -1)).sum(:payment_transaction_amount)
    @july = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 7, 1), Date.civil(Date.today.year, 7, -1)).sum(:payment_transaction_amount)
    @august = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 8, 1), Date.civil(Date.today.year, 8, -1)).sum(:payment_transaction_amount)
    @september = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 9, 1), Date.civil(Date.today.year, 9, -1)).sum(:payment_transaction_amount)
    @october = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 10, 1), Date.civil(Date.today.year, 10, -1)).sum(:payment_transaction_amount)
    @november = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 11, 1), Date.civil(Date.today.year, 11, -1)).sum(:payment_transaction_amount)
    @december = PaymentTransaction.where("payment_transaction_date BETWEEN ? AND ?", Date.civil(Date.today.year, 12, 1), Date.civil(Date.today.year, 12, -1)).sum(:payment_transaction_amount)

    @monthly_revenue = [
      {
        name: "January",
        y: @january,
        drilldown: "Jan",
      },
      {
        name: "February",
        y: @february,
        drilldown: "Feb",
      },
      {
        name: "March",
        y: @march,
        drilldown: "march",
      },
      {
        name: "April",
        y: @april,
        drilldown: "april",
      },
      {
        name: "May",
        y: @may,
        drilldown: "may",
      },
      {
        name: "June",
        y: @june,
        drilldown: "june",
      },
      {
        name: "July",
        y: @july,
        drilldown: "July",
      },
      {
        name: "August",
        y: @august,
        drilldown: "august",
      },
      {
        name: "September",
        y: @september,
        drilldown: "september",
      },
      {
        name: "October",
        y: @october,
        drilldown: "october",
      },
      {
        name: "November",
        y: @november,
        drilldown: "november",
      },
      {
        name: "December",
        y: @december,
        drilldown: "december",
      },
    ]

    return @monthly_revenue
  end
end
