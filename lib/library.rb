# date.next_month can be used to
# put 30 days for books to be returned
require "yaml"

class Library
  attr_accessor :collection, :item, :available

  def initialize(attrs = {})
    @collection = YAML.load_file("./lib/data.yml")
  end

  def search(book)
    collection.select { |book| book[:item][:title].include? "Alfons" }
  end

  def available_books
    @collection.detect { |book| book[available].include? "Alfons" }
  end
end
