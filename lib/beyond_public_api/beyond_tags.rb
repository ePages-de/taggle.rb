# frozen_string_literal: true

# Beyond tags API calls
class BeyondTags
  attr_accessor :tags
  def initialize(json_product_data)
    @tags = []
    json_product_data["tags"].each do |tag|
      @tags << BeyondTag.new(tag)
    end
  end
end