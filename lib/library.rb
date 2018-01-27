require 'yaml'
require 'date'
require 'person'

class Library

  attr_accessor :booklist

  def initialize
    @booklist = YAML.load_file('./lib/data.yml')
  end

  def availability(title, author)
    #The find method returns the first element for which block is not false:
    book_info = @booklist.find { |obj| obj[:item][:title] == title and obj[:item][:author] == author }
      if book_info == nil
        false
      else
        book_info[:available]
      end
  end

end
