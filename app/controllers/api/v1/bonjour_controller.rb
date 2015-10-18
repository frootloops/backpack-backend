class Api::V1::BonjourController < ApiController
  def create
    device_token = request.headers["HTTP_X_TRAVELER_DEVICE"]
    auth_token = request.headers["HTTP_X_TRAVELER_TOKEN"]

    if device_token && !auth_token && !Traveler.exists?(device_token: device_token)
      traveler = Traveler.new(phone: params[:phone], device_token: device_token)
      if traveler.save
        render json: traveler, status: :created
      end
    end

    if device_token && auth_token && Traveler.exists?(device_token: device_token) && !Traveler.exists?(authentication_token: auth_token)
      traveler = Traveler.find_by(device_token: device_token)
      traveler.authentication_token = ""
      traveler.ensure_authentication_token
      traveler.save!
      render json: traveler
    end
  end

  def check
    render nothing: true
  end

  protected

  def traveler_token_authenticable?
    %w(create).include?(action_name) ? false : super
  end
end
