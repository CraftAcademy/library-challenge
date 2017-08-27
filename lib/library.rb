require 'yaml'
require 'date'
require './lib/person.rb'

class Library
  attr_accessor :books

  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    books.select { |obj| obj[:item] }
  end

  def loan_books
    books[2][:available] = false
    books[2][:return_date] = set_outdate
    books[2][:renter] = Person
    File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
  end

  def search_books_NA
    books[2][:available] == false
      raise 'Not available'
    end
  end





  def check_outdate
    books.select { |obj| obj[:item][:title]}
    if [:available] == false
      return [:return_date]
    end
  end

private

  def set_outdate
    Date.next_month
  end

  def books
    YAML.load_file('./lib/books.yml')
  end

  def change_books
    File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
  end
end
