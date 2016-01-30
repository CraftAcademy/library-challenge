require 'data'

class Person
#  attr_accesor :books :duedate

  def initialize(options={})
    @portfolio = []
  end

  def rent(book)
    add = {item: book, duedate: duedate}
    @portfolio.push add
  end

  def return(book)
    remove = portfolio.any?{item: book, duedate: duedate}
    @portfolio.pop remove
  end

end
