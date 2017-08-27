require 'yaml'
require 'date'
require './lib/person.rb'

class Library
  attr_accessor :books, :title, :available, :renter, :return_date

  def initialize(books, title, available, renter, return_date)
    @books = books
    @title = title
    @available = available
    @renter = name
    @return_date = date.today.next_month


  end

  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    YAML.load_file('./lib/books.yml')
  end

  def search_books
    def search_books(title)
  book = books.select { |obj| obj[:item][:title] == title}
  if book[:available] == false
    'Not available'
  else
    book
  end
end

def book
  books.select { |obj| obj[:available] == true}
  @books[:available] = false
  @books[:return_date]= @return_date
  @books[:renter] = name
  change_books
end


  def check_outdate
    check = books.select{ |obj| obj[:item][:title].include? ''}
    if check = [:available] == false
      return @return_date
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
end
