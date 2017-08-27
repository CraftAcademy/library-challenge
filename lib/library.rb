require 'yaml'
require 'date'
require './lib/person.rb'

class Library
  attr_accessor :books

  def initialize
    @books = books
  end

  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    books.select { |obj| obj[:item] }
  end

  def search_books
    books.select { |obj| obj[:item][:title] == ''}
    if books.select { |obj| obj[:available] == false}
    raise 'Not available'
  elsif books.select { |obj| obj[:available] == true}
      @books[:available] = false
      @books[:return_date] = set_outdate
      @books[:renter] = Person
      change_books
    end
  end

  def check_outdate
    check = books.select{ |obj| obj[:item][:title].include? ''}
    if check = [:available] == false
      return set_outdate
    end
  end

  def set_outdate
    Date.today.next_month
  end

  def books
    YAML.load_file('./lib/books.yml')
  end

  def change_books
    File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
  end
end
