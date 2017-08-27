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

  def search_books
    books.select { |obj| obj[:item][:title] = "Osynligt med Alfons"}
    is [:available] == false
    raise 'Not available'
    elsif [:available] == true
      books[:available] = false
      books[:return_date] = set_outdate
      books[:renter] = 'Olof'
      change_books
    end
  end

  def search_books_NA
    books[index][:available] == false
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
