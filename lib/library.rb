require 'yaml'

class Library

  attr_accessor :books

  def initialize(books)
    @books = YAML.load_file('./lib/data.yml')

  end

  def available_books
    list = @books
    list.select { |obj| obj[:available] == true  }
  end

  def all_books
    list = @books
  end

  def person_checkout
    @books[0][:available] = false
  end

  def return_date
    @books[0][:return_date] = Date.today + 30
  end

end
