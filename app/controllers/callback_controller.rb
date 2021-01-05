class CallbackController < ApplicationController
  def mpesa_frontend_transaction
    response = nil
    puts mpesa_frontend_transaction_params
    response_params = {
      PayBillNumber: mpesa_frontend_transaction_params["account_to"],
      PhoneNumber: mpesa_frontend_transaction_params["account_from"],
      MpesaReceiptNumber: mpesa_frontend_transaction_params["transaction_code"],
      Amount: mpesa_frontend_transaction_params["amount"],
      AccountReference: mpesa_frontend_transaction_params["ref"],
      TransactionDesc: mpesa_frontend_transaction_params["TransactionDesc"],
      FullNames: "",
      TransTime: mpesa_frontend_transaction_params["date"],
      PaymentMode: mpesa_frontend_transaction_params["payment_mode"],
    }
    @bill_info = BillInfo.find_by(:bill_no => mpesa_frontend_transaction_params["ref"])
    if @bill_info != nil
      @booking_order = BookingOrder.find_by(:id => @bill_info.booking_order_id)
      BillInfo.transaction do
        @bill_info.update(
          :reducing_balance => @bill_info.reducing_balance.to_i - mpesa_frontend_transaction_params["amount"].to_i,
        )

        if @bill_info.reducing_balance.to_i > 0
          @bill_info.update(
            :bill_status => "16",
          )
        elsif @bill_info.reducing_balance.to_i == 0
          @bill_info.update(
            :bill_status => "17",
          )
        elsif @bill_info.reducing_balance.to_i < 0
          @bill_info.update(
            :bill_status => "18",
          )
        end
        @payment_transaction = PaymentTransaction.new(
          payment_transaction_id: PaymentTransaction.payment_transaction_id,
          booking_order_id: @booking_order.id,
          bill_no: @bill_info.bill_no,
          payment_transaction_date: mpesa_frontend_transaction_params["date"],
          payment_transaction_type_id: "",
          payment_transaction_amount: mpesa_frontend_transaction_params["amount"],
          payment_mode_id: PaymentMode.find_by(:payment_mode_description => mpesa_frontend_transaction_params["payment_mode"]).id,
        )
        @payment_transaction.save
      end
      
      response = {
        status: 200,
        message: "Bill payed successfully",
        data: @bill_info,
      }
    else
      response = {
        status: 200,
        message: "Bill not found",
      }
    end

    render json: response
  end

  # POST /mpesa_transactions
  def receive_mpesa_transactions
    puts receive_mpesa_transactions_params

    response_params = {
      PayBillNumber: receive_mpesa_transactions_params["PayBillNumber"],
      PhoneNumber: receive_mpesa_transactions_params["PhoneNumber"],
      MpesaReceiptNumber: receive_mpesa_transactions_params["MpesaReceiptNumber"],
      Amount: receive_mpesa_transactions_params["Amount"],
      AccountReference: receive_mpesa_transactions_params["AccountReference"],
      TransactionDesc: receive_mpesa_transactions_params["TransactionDesc"],
      FullNames: receive_mpesa_transactions_params["FullNames"],
      TransTime: receive_mpesa_transactions_params["TransTime"],
    }

    response = {
      status: 200,
      message: "MPESA transaction received successfully",
      data: response_params,
    }
    render json: response
  end

  def receive_card_transactions
    puts receive_card_transactions_params
    response = {
      status: 200,
      message: "CARD transaction received successfully",
      data: [],
    }
    render json: response
  end

  private

  def mpesa_frontend_transaction_params
    params.permit(
      :account_to,
      :ref,
      :TransactionDesc,
      :amount,
      :account_from,
      :date,
      :message,
      :payment_mode,
      :transaction_code
    )
  end

  def receive_mpesa_transactions_params
    params.permit(:PayBillNumber, :PhoneNumber, :MpesaReceiptNumber, :Amount, :AccountReference, :TransactionDesc, :FullNames, :TransTime)
  end

  def receive_card_transactions_params
    params.permit(:code, :status, :message, :id, :submitTimeUtc, :reconciliationId, :authorizedAmount, :currency)
  end
end
