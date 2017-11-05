require "yaml"

class Library

  CHECKOUT_DURATION = 1

  attr_accessor :books, :return_date

  def initialize
    @books = YAML.load_file("./lib/data.yml")
    @return_date = set_return_date
  end

private

  def record_available_books
    available_books = collection.select { |obj| obj[:available] == true }
    available_books
  #  available_books[:author].to_s + ", " + available_books[:title]
  end

  def set_return_date
    Date.today.next_month(CHECKOUT_DURATION).strftime('%d/%m')
  end


end
