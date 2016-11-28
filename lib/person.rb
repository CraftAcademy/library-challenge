require 'date'
require 'pry'

class Person
  attr_accessor :portfolio

  def initialize
    @portfolio = []
  end

  def rent(library, args={})
    #binding.pry
    item = library.books.detect { |obj| obj[args.keys.first] == args[args.keys.first] }
    to_add = {}
    if item
      if args.keys.first == :title
        library.lend(self, title: item[:title])
      elsif args.keys.first == :author
        library.lend(self, author: item[:author])
      end
      to_add.merge!({title: item[:title],
                     author: item[:author],
                     duedate: duedate})
      @portfolio.push to_add
    else
      'Nothing was added'
    end

  end


  def duedate
    "2016-03-03"
  end

end
