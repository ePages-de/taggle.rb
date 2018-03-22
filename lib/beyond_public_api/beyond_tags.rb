# frozen_string_literal: true

# Beyond tags API calls
class BeyondTags
  attr_accessor :tags
  def initialize(json_product_data)
    @tags = []
      json_product_data["tags"].each do |tag|
      beyondTag = BeyondTag.new(tag)
        @tags << {'text' => beyondTag.name, 'weight' => beyondTag.value}
    end
  end
end
