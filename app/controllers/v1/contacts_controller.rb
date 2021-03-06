# frozen_string_literal: true

module V1
  class ContactsController < ApplicationController
    before_action :set_contact, only: %i[show update destroy]

    # GET /contacts
    def index
      # json api especification > localhost:3000/v1/contacts?page%5Bnumber%5D=3&page%5Bsize%5D=5
      page_number = params[:page].try(:[], :number)
      per_page = params[:page].try(:[], :size)

      @contacts = Contact.all.page(page_number).per(per_page)

      # expires_in 5.seconds, public: true
      # actionpack/lib/action_controller/metal/conditional_get.rb
      if stale?(etag: @contacts)
        render json: @contacts, include: %i[kind phones address]
      end
    end

    # GET /contacts/1
    def show
      render json: @contact, include: %i[kind phones address]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors)
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      # params.require(:contact).permit(
      #   :name, :email, :birthdate, :kind_id,
      #   phones_attributes: %i[id number _destroy],
      #   address_attributes: %i[id street city]
      # )
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
