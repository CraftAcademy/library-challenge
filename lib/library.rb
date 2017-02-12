require 'yaml'

class Library

  attr_accessor :books

  def initialize(books)
    @books = YAML.load_file('./lib/data.yml')
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }#.each_with_index {|val, index| puts "#{val} => #{index}" }
  end

  def all_books
   @books#.each_with_index {|val, index| puts "#{index}" }
  end

  def person_checkout
    @books[0][:available] = false
  end

  def return_date
    @books[0][:return_date] = Date.today + 30
  end

  def return_book
    @books[0][:available] = false
    @books[0][:return_date] = nil
  end

end
