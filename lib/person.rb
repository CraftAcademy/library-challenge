#require 'library.rb'
require 'yaml'
require 'date'

class Person

attr_accessor :bookshelf, :has_overdue_books

  def initialize
    @bookshelf = []
    @has_overdue_books = false
  end

  def clear_bookshelf
    @bookshelf = []
  end

  def check_overdue_books
    date = Date.today.strftime
    overdue_book = @bookshelf.detect { |obj| obj[:return_date] != nil }
    if overdue_book.nil?
      @has_overdue_books = false
    elsif overdue_book[:return_date] > date
      @has_overdue_books = false
    elsif overdue_book[:return_date] < date
      @has_overdue_books = true
    end
  end

  def return_book(book)
    @bookshelf.delete_if { |item| book.include?(item[:item][:title]) }
    #@bookshelf.delete_if { |item| item[:item][:title] == book }
    # Goes through the books and only updates the one we returneds
    @bookshelf.each do |items|
      if items[:item][:title] == book
        items[:available] = true
        items[:return_date] = nil
      end
    end

    # Opens and writes to our Yaml-file
    File.open('./lib/data.yml', 'w') { |f| f.write @bookshelf.to_yaml }
    book
  end

end
