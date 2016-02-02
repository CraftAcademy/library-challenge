require 'date'
require 'pry'

class Person
  attr_accessor :portfolio

  def initialize
    @portfolio = []
  end

  def rent(library, args={})
    item = library.books.detect{|obj| obj[args.keys.first] == (args[args.keys.first]).to_s }
    #item = library.books.detect { |a| a[:title] == book[:title] }
    to_add = {}
    if item
      to_add.merge!({title: item[:title],
                    author: item[:author],
                    duedate: duedate })
      @portfolio.push to_add
    else
      'Nothing was added'
    end

  end


  def duedate
    "2016-03-02"
  end

end
