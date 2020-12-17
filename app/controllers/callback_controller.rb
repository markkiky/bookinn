class CallbackController < ApplicationController

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
      TransTime: receive_mpesa_transactions_params["TransTime"]
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

  def receive_mpesa_transactions_params
    params.permit(:PayBillNumber, :PhoneNumber, :MpesaReceiptNumber, :Amount, :AccountReference, :TransactionDesc, :FullNames, :TransTime)
  end

  def receive_card_transactions_params
    params.permit(:code, :status, :message, :id, :submitTimeUtc, :reconciliationId, :authorizedAmount, :currency)
  end
end
