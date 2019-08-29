class AddressesController
  before_action :set_contact

  def show
    render json: @addresses.address
  end

  def update
    if @contact.address.update(address_params)
      render json: @contact.address
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def create
    @contact.address = Address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.address.destroy
  end

  private

  def set_address
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializer::Deserialization.jsonapi_parse(params)
  end
end
