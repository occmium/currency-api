class CurrenciesController < ApplicationController
  def index
    currencies = Currency.paginate(page: params[:page], per_page: 10)
    render json: currencies
  end

  def show
    currency = Currency.find(params[:id])
    render json: currency
  end
end
