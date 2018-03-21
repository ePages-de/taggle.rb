# frozen_string_literal: true

# Beyond product API calls
class BeyondProduct
  attr_accessor :id, :sku, :name, :tags
  def initialize(json_product_data)
    @id = json_product_data["_id"]
    @sku = json_product_data["sku"]
    @name = json_product_data["name"]
    @tags = json_product_data["tags"]
  end
end
