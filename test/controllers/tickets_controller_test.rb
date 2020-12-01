require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url, as: :json
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { created_by: @ticket.created_by, customer_id: @ticket.customer_id, ticket_date: @ticket.ticket_date, ticket_description: @ticket.ticket_description, ticket_id: @ticket.ticket_id, ticket_no: @ticket.ticket_no, ticket_status: @ticket.ticket_status, updated_by: @ticket.updated_by } }, as: :json
    end

    assert_response 201
  end

  test "should show ticket" do
    get ticket_url(@ticket), as: :json
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { created_by: @ticket.created_by, customer_id: @ticket.customer_id, ticket_date: @ticket.ticket_date, ticket_description: @ticket.ticket_description, ticket_id: @ticket.ticket_id, ticket_no: @ticket.ticket_no, ticket_status: @ticket.ticket_status, updated_by: @ticket.updated_by } }, as: :json
    assert_response 200
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket), as: :json
    end

    assert_response 204
  end
end
