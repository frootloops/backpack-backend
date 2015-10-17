class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for Traveler, if: ->(controller) do
    controller.traveler_token_authenticable?
  end

  protected

  def traveler_token_authenticable?
    true
  end
end
