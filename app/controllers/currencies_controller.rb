class CurrenciesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access

  def index
    currencies = Currency.paginate(page: params[:page], per_page: 10)
    render json: currencies
  end

  def show
    currency = Currency.find(params[:id])
    render json: currency
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, _|
        ApiKey.exists?(access_token: token)
      end
    end
end
