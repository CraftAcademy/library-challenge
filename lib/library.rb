require 'yaml'
require 'date'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def books_available
    @books.select { |x| x[:available] == true }
  end

  def checkout(id, person)
    index = @books.index {|x| x[:item][:id] === id }
    if @books[index][:available] == true
      @books[index][:available] = false
      @books[index][:person] = person
      @books[index][:return_date] = Date.today.next_day(30).strftime('%Y-%m-%d')
      @books[index][:item][:title] + ' checked out successfully, please return on ' + @books[index][:return_date]
    else
      "Book not available"
    end
  end

end
