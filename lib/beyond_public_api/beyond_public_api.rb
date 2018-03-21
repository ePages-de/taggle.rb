# frozen_string_literal: true

# Beyond public API module
module BeyondPublicApi
  require_relative 'beyond_connection'
  require_relative 'beyond_jwt'
  require_relative 'beyond_product'

  # Beyond product API calls
  class Product
    def product(id)
      # Call request
      # Parse response into an object
    end

    def products
      # Call request
      # Parse response into an object
    end
  end
end
