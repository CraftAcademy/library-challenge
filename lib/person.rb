require 'yaml'
require 'date'

class Person

  attr_accessor :booklist

  def initialize
    @booklist = []
  end

  def add_to_list(checked_out_book)
    @booklist.push(title: checked_out_book[:title],
                   author: checked_out_book[:author],
                   return_date: checked_out_book[:return_date])
  end
  
end
