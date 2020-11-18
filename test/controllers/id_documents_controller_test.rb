require 'test_helper'

class IdDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @id_document = id_documents(:one)
  end

  test "should get index" do
    get id_documents_url, as: :json
    assert_response :success
  end

  test "should create id_document" do
    assert_difference('IdDocument.count') do
      post id_documents_url, params: { id_document: { id_document_no: @id_document.id_document_no, id_document_status: @id_document.id_document_status, id_document_type: @id_document.id_document_type } }, as: :json
    end

    assert_response 201
  end

  test "should show id_document" do
    get id_document_url(@id_document), as: :json
    assert_response :success
  end

  test "should update id_document" do
    patch id_document_url(@id_document), params: { id_document: { id_document_no: @id_document.id_document_no, id_document_status: @id_document.id_document_status, id_document_type: @id_document.id_document_type } }, as: :json
    assert_response 200
  end

  test "should destroy id_document" do
    assert_difference('IdDocument.count', -1) do
      delete id_document_url(@id_document), as: :json
    end

    assert_response 204
  end
end
