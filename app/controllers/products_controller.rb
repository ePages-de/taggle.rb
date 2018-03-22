class ProductsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @products = BeyondPublicApi::Product.products
    @tag_cloud = [
      { text: "test", weight: 15},
      { text: "Ipsum", weight: 9, link: "http://jquery.com/"},
      { text: "Dolor", weight: 6, html: {title: "I can haz any html attribute"}},
      { text: "Sit", weight: 7},  {text: "Amet", weight: 5}
   ]
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
