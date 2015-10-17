class Api::V1::BonjourController < ApiController
  skip_before_filter :authenticate, only: [:create]

  def create
  end

  def check
    render nothing: true
  end
end
