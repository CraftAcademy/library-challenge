require './lib/library.rb'
require './lib/error_handler.rb'

class Person
  attr_accessor :bookshelf

  def initialize

  end

  def checkout(args)
    args[:lib] == nil ? ErrorHandler.alert('The library does not exist'): library = args[:lib]
    title = args[:title]
    library.checkout(title)
  end
end
