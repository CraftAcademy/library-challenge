# date.next_month can be used to
# put 30 days for books to be returned
require "yaml"

class Library
  attr_accessor :collection, :item

  def initialize
    @collection = YAML.load_file("./lib/data.yml")
  end
end
