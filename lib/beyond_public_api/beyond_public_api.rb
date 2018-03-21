# frozen_string_literal: true

# Beyond public API module
module BeyondPublicApi
  require_relative 'beyond_utils'
  require_relative 'beyond_request'
  require_relative 'beyond_connection'
  require_relative 'beyond_jwt'
  require_relative 'beyond_product'

  # Beyond product API calls
  class Product
    def self.product(id)
      # Call request
      # Parse response into an object
    end

    def self.products
      response = BeyondRequest.new("/api/products", "get", {locale: "en-US"}).perform
      # BeyondSite.new(JSON.parse(response.body))
      # Call request
      # Parse response into an object
    end
  end
end
