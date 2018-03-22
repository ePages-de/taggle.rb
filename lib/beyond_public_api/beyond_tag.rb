# frozen_string_literal: true

# Beyond tags API calls
class BeyondTag
  attr_accessor :name, :value
  def initialize(tag)
    @name = tag.first.keys.first
    @value = tag.first.values.first
  end
end