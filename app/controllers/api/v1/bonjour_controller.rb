class Api::V1::BonjourController < ApiController
  def create
    create_new_traveler || update_auth_token || head(:unauthorized)
  end

  def check
    render nothing: true
  end

  protected

  def traveler_token_authenticable?
    %w(create).include?(action_name) ? false : super
  end

  private

  def create_new_traveler
    return unless device_token
    return unless !auth_token
    return unless !Traveler.exists?(device_token: device_token)

    traveler = Traveler.new(device_token: device_token)
    traveler.save!
    render json: traveler, status: :created
  end

  def update_auth_token
    return unless device_token
    return unless auth_token
    return unless Traveler.exists?(device_token: device_token)
    return unless !Traveler.exists?(authentication_token: auth_token)

    traveler = Traveler.find_by(device_token: device_token)
    traveler.authentication_token = ""
    traveler.ensure_authentication_token
    traveler.save!
    render json: traveler
  end
end
