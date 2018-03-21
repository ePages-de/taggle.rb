class ProductsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @products = BeyondPublicApi::Product.products
  end

  def show
    @product = BeyondProduct.new(params["id"])
  end

  def about
    @word = ENV['TEST']
    @number = params[:number].to_i
    render 'show'
  end
end
