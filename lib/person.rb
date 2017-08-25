require 'date'

class Person

  attr_accessor :available_books, :shelf

  def initialize
    @shelf = YAML.load_file('./books/data.yml')
    @available_books = @shelf.select { |obj| obj[:available]}
  end

  def available
    if @available_books
      'Book is available for borrowing'
    else
      'Book is not available for borrowing'
    end
  end
end
