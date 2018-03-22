# frozen_string_literal: true

# Beyond product API calls
class BeyondProduct::Price
  attr_accessor :currency, :amount

  def initialize(json_product_price_data)
    @currency = json_product_price_data["currency"]
    @amount = json_product_price_data["amount"]
  end
end
