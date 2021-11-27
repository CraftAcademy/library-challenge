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

  def checkout(item, person)
    item["available"] = false
    item["return_date"] = Date.today.next_month.strftime("%Y-%m-%d")
    person.book_shelf.push(item)
    File.open("./lib/data.yml", "w") { |file| file.write @books.to_yaml }
  end
end
