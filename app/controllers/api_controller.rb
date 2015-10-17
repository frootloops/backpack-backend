class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :authenticate

  private

  def authenticate
    authenticate_traveler_by_token! && authenticate_traveler!
  end

  def authenticate_traveler_by_token!
    render status: :unauthorized
  end
end
