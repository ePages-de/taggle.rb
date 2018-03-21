class AboutController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @number = 10
  end

  def show_number
    @number = params[:number].to_i
    render 'show'
  end
end
