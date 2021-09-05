require "./lib/library"
require "yaml"

class Visitor
  TIME_RETURN_OPTION = 1

  def initialize(_attrs = {})
    @collection = YAML.load_file("./lib/data.yml")
  end

  def visitor_available_books
    YAML.load_file("./lib/data.yml").select { |book| book[:available] == true }
  end

  def book_return_date
    time_add_month = Date.today.next_month(TIME_RETURN_OPTION).strftime("%Y-%m-%d")
    { message: "Please return by date: #{time_add_month}" }
  end

  def checkout_book(title)
    book = @collection.detect { |book| book[:item][:title] == title }
    if book[:available] == true
      book[:available] = false
      book[:return_date] = book_return_date
      return book_return_date
    end
    File.open("./lib/data.yml", "w") { |file| file.write collection.to_yaml }
  end
end
