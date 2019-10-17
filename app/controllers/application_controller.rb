class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :ensure_json_request

  def ensure_json_request
    render nothing: true, status: 406 unless request.headers['Accept'] =~ /json/

    return if request.get?

    return if request.headers['Content-Type'] =~ /json/

    render nothing: true, status: 415
  end
end
