require 'yaml'

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }.each_with_index {|val, index| puts "#{val} checkout nr #{index}" }
  end

  def all_books
   @books.each_with_index {|val, index| puts "#{val} checkout nr #{index}" }
  end

  def person_checkout(book_nr)
    @books[book_nr][:available] = false
    @books[book_nr][:return_date] = Date.today + 30
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
  end

  def return_book(book_nr)
    @books[book_nr][:available] = true
    @books[book_nr][:return_date] = 'in_house'
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
  end

end
