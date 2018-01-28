require 'yaml'
require 'date'

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

  #LIST BOOKS
  def list_available_books
    @books.select {|book| book[:available] == true }
  end

  def list_checked_out_books
    @books.select {|book| book[:available] == false }
  end

  #SEARCH BOOKS
  # search for book dependent on their state
  def search_books_by_title(query, state)
    results = []
    search_result = @books.select { |items| items[:item][:title].include? query }
    search_result.each do |book|
      if state == book[:available]
        results << book
      elsif state == 'All'
        results << book
      end
      results
    end
  end

  #CHECKOUT BOOK
  def checkout_book(book, person)
    # is the book available?
    # does the person have overdue books on the bookshelf?
    selection = @books.select { |items| items[:item][:title].include? book }
    if selection[0][:available] == true #&& visitor.has_overdue_books == false
      "hejsan"
    else "Sorry, book is already checked out"
    end

  end

  def checkout(book,person)
    my_choice = @books.select { |obj| obj[:item][:title].include? book }
    #binding.pry
    my_choice[0][:available] = false
    my_choice[0][:return_date] = Date.today >> 1
    visitor.bookshelf << my_choice

    # Goes through the books and only updates the one we checked out
    @books.each do |items|
      if items[:item][:title] == my_choice[0][:item][:title]
        items[:available] = false
        items[:return_date] = Date.today >> 1
      end
    end

    # Opens and writes to our Yaml-file
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    my_choice[0][:item][:title]
  end

end


#
# #LIST BOOKS
# def list_books
#   @books.each do |items|
#     book = items[:item][:title]
#     author = items[:item][:author]
#     available = items[:available]
#     return_date = items[:return_date]
#
#     #Checks parameter "available"
#     items[:available] ? status = 'Available' : status = 'Checked out'
#     #Returns a string with books
#     "Book: #{book}, Author: #{author}, Is: #{status}"
#     #puts "Book: #{book}, Author: #{author}, Available: #{status}"
#
#   end
# end
