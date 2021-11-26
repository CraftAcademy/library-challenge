require "yaml"
require "pry"
require "date"

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file("./lib/data.yml")
  end

  def search(title)
    @books.detect { |item| item[:book][:title] == title }
  end

  def checkout(object)
    object["available"] = false
    object["return_date"] = Date.today.next_month.strftime("%Y-%m-%d")
  end
end
