class AddressesController
  before_action :set_address

  def show
    render json: @addresses
  end

  private

  def set_address
    @address = Contact.find(params[:contact_id]).address
  end
end
