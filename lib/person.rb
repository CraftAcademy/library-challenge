#require 'library.rb'
require 'yaml'
require 'date'

class Person

attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end

  def clear_bookshelf
    @bookshelf = []
  end

  def has_overdue_books

  end

end
