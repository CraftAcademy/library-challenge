require 'Book'
require 'Date'

class Person
 attr_accessor :portfolio

  def initialize(person)
   @portfolio = []
  end

def rent(book)
    items = books.detect{|a| a[:title] == title}
    add = {item: items, duedate: duedate }
    @portfolio.push add

end
