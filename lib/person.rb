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
    @bookshelf.detect { |obj| obj[:return_date] < Date.today.strftime }
    @has_overdue_books = true
  end

end
