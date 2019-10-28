# frozen_string_literal: true

require 'rails_helper'

describe V1::ContactsController, type: :controller do
  # just for example. Dont use this way
  it 'request index and return 200 OK' do
    request.accept = 'application/json'
    get :index
    expect(response.status).to eql(200)
  end

  it 'request index and return 200 OK' do
    request.accept = 'application/json'
    get :index
    expect(response).to have_http_status(200)
  end

  it 'request index and return 406 NOT ACCEPTABLE' do
    get :index
    expect(response).to have_http_status(406)
  end

end
