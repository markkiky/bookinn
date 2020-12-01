class IdDocumentsController < ApplicationController
  before_action :set_id_document, only: [:show, :update, :destroy]

  # GET /id_documents
  def index
    @id_documents = IdDocument.all

    render json: @id_documents
  end

  # GET /id_documents/1
  def show
    render json: @id_document
  end

  # POST /id_documents
  def create
    @id_document = IdDocument.new(id_document_params)

    if @id_document.save
      render json: @id_document, status: :created, location: @id_document
    else
      render json: @id_document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /id_documents/1
  def update
    if @id_document.update(id_document_params)
      render json: @id_document
    else
      render json: @id_document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /id_documents/1
  def destroy
    @id_document.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_id_document
      @id_document = IdDocument.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def id_document_params
      params.require(:id_document).permit(:id_document_no, :id_document_type, :id_document_status)
    end
end
