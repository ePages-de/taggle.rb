# frozen_string_literal: true

# Beyond tags API calls
class BeyondTag
  attr_accessor :name, :value
  def initialize(tag)
    @name = tag.keys.first
    @value = tag.values.first
  end
end