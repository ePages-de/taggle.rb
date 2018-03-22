class ProductsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @products = BeyondPublicApi::Product.products
    @tag_cloud = [BeyondPublicApi::Tags.list]
  end

  def show
    @product = BeyondPublicApi::Product.product(params[:id])
  end

  def about
    @word = ENV['TEST']
    @number = params[:number].to_i
    render 'show'
  end
end
