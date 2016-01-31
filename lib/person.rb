#require 'data'

class Person
 attr_accessor :potfolio

  def initialize(options={})
   @portfolio = options[:books] || []
  end

 #def rent(library,book)
  # books.detect do |book|
  #        if  book[:status] = :okay then
  #  book = library.books.detect{}
#    add = {item: book, duedate: duedate}

  #  @portfolio.push add
  #end

#  def return(book)
#    remove = portfolio.any?{item: book, duedate: duedate}
#    @portfolio.pop remove
#  end

end
