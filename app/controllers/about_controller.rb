class AboutController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @number = 10
  end

  def show_number
    @word = ENV['TEST']
    @number = params[:number].to_i
    render 'show'
  end
end
