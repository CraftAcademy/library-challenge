# date.next_month can be used to
# put 30 days for books to be returned
require 'yaml'
require 'date'

class Library
  attr_accessor :collection, :return_date

  def initialize(_attrs = {})
    @collection = YAML.load_file('./lib/data.yml')
  end

  def search(_book)
    collection.select { |book| book[:item][:title] == book }
  end

  def available_books
    @collection.select { |book| book[:available] == true }
  end

  def book_return_date
    Date.today.next_month
  end
end
