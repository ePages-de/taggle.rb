# frozen_string_literal: true

# Beyond product API calls
class BeyondProducts
  attr_accessor :products, :page

  def initialize(json_products)
    @products = []
    @page = json_products.dig("page", "size")
    json_products.dig("_embedded", "products")&.each do |json_product|
      @products << BeyondProduct.new(json_product)
    end
  end
end
