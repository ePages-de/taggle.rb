# frozen_string_literal: true

# Beyond public API module
module BeyondPublicApi
  require_relative 'beyond_utils'
  require_relative 'beyond_request'
  require_relative 'beyond_connection'
  require_relative 'beyond_jwt'
  require_relative 'beyond_product'
  require_relative 'beyond_products'

  # Beyond product API calls
  class Product
    def self.product(id)
      id
    end

    def self.products
      response = BeyondRequest.new("/api/products", "get").perform
      BeyondProducts.new(JSON.parse(response.body))
    end
  end
end
