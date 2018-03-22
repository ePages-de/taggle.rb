# frozen_string_literal: true

# Beyond product API calls
class BeyondProduct::Image
  attr_accessor :href

  def initialize(id, json_product_image_data)
    response = BeyondRequest.new("/api/products/#{id}/images", "get").perform
    @href = JSON.parse(response.body)['_embedded']['images'].first['_links']['data']['href']
  end
end
