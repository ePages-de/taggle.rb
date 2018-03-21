class AboutController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @number = 10
  end

  def show_number
    @products = BeyondPublicApi::Product.products
    @word = ENV['TEST']
    @number = params[:number].to_i
    render 'show'
  end
end
