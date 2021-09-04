# date.next_month can be used to
# put 30 days for books to be returned
require "yaml"

class Library
  attr_accessor :collection, :item, :available

  def initialize(attrs = {})
    @collection = YAML.load_file("./lib/data.yml")
  end

  def search(book)
    collection.select { |book| book[:item][:title] == book }
  end

  def available_books
    @collection.select { |book| book[:available] == true }
  end
end
