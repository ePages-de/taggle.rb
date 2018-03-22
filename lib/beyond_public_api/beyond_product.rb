# frozen_string_literal: true

# Beyond product API calls
class BeyondProduct
  attr_accessor :id, :sku, :name, :tags, :image, :description, :price
  def initialize(json_product_data)
    @id = json_product_data["_id"]
    @sku = json_product_data["sku"]
    @name = json_product_data["name"]
    @tags = json_product_data["tags"]
    @description = json_product_data["description"]

    @image = BeyondProduct::Image.new(@id, json_product_data["_links"])
    @price = BeyondProduct::Price.new(json_product_data["salesPrice"])
  end
end
