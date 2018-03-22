# frozen_string_literal: true

# Beyond public API module
module BeyondPublicApi
  require_relative 'beyond_utils'
  require_relative 'beyond_request'
  require_relative 'beyond_connection'
  require_relative 'beyond_jwt'
  require_relative 'beyond_product'
  require_relative 'beyond_products'
  require_relative 'beyond_product_image'
  require_relative 'beyond_product_price'
  require_relative 'beyond_tag'
  require_relative 'beyond_tags'

  # Beyond product API calls
  class Product
    def self.product(id)
      response = BeyondRequest.new("/api/products/#{id}", "get").perform
      BeyondProduct.new(JSON.parse(response.body))
    end

    def self.products
      response = BeyondRequest.new("/api/products", "get").perform
      BeyondProducts.new(JSON.parse(response.body))
    end
  end
  # Beyond product tags API calls
  class Tags
    def self.list
      response = BeyondRequest.new('/api/product-view/products/search/find-available-tags', "get").perform
      BeyondTags.new(JSON.parse(response.body))
    end

    def self.update_tags(product_id, tags)
      BeyondRequest.new("/api/products/#{product_id}", "patch", tags).perform
    end
  end
end
