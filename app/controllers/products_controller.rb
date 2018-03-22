class ProductsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @products = BeyondPublicApi::Product.products
    @tag_cloud = BeyondPublicApi::Tags.list
  end

  def show
    @product = BeyondPublicApi::Product.product(params[:id])
  end

  def update_tags
    tag_array = []
    params[:tags].split(',').each do |tag|
      tag_array << tag.sub('%20', ' ')
    end
    tags = {
      'tags' => tag_array
    }
    BeyondPublicApi::Tags.update_tags(params[:product_id], tags)
    redirect_to product_path(params[:product_id])
  end

  def add_tag
    tag_array = [params['tag'][:new_tag].sub('%20', ' ')]
    params['tag'][:old_tags].split(' ').each do |tag|
      tag_array << tag.sub('%20', ' ')
    end
    tags = {
      'tags' => tag_array
    }
    BeyondPublicApi::Tags.update_tags(params[:product_id], tags)
    redirect_to product_path(params[:product_id])
  end

  def about
    @word = ENV['TEST']
    @number = params[:number].to_i
    render 'show'
  end
end
