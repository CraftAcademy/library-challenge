require 'yaml'
require 'date'
require './lib/person.rb'

class Library

  attr_accessor :books

  def initialize
    @books = YAML::load_file(File.join(__dir__, 'data.yml'))
  end

  #SET DUE DATE TEST
  def set_due_date(book)
    selection = @books.detect { |obj| obj[:item][:title] == book }
    selection[:available] = false
    selection[:return_date] = "#{Date.today >> 1}"
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    @books
  end


  #CHECKOUT BOOK
  def checkout_book(book, person)

    # is the book available?
    # does the person have overdue books on the bookshelf?

    selection = @books.detect { |obj| obj[:item][:title] == book }

    if selection[0][:available] == true && person.has_overdue_books == false
    end

    selection[:available] = false
    selection[:return_date] = "#{Date.today >> 1}"
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    @books
  end


  #LIST BOOKS
  def list_available_books
    @books.select {|book| book[:available] == true }
  end

  def list_checked_out_books
    @books.select {|book| book[:available] == false }
  end


  #SEARCH BOOKS
  # search for book dependent on their state
  def search_books_by_title(query)
    @books.select { |obj| obj[:item][:title].include? query  }
  end

  def search_books_by_author(query)
    @books.select { |obj| obj[:item][:author].include? query  }
  end
end
