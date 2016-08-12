require "yaml"
require "Date"

class Library
  attr_accessor :items

  def initialize(items)
    self.items = items
  end

  def has_item?(search_item)
    for item in items
      return true if item == search_item
    end
  false
  end
end
