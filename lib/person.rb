require './lib/library.rb'
require './lib/error_handler.rb'

class Person
  attr_accessor :bookshelf

  def initialize
    @bookshelf = YAML.load_file('./lib/my_bookshelf.yml')
  end

  def checkout(args)
    args[:lib] == nil ? ErrorHandler.alert('The library does not exist'): library = args[:lib]
    title = args[:title]
    book = library.checkout(title)
    @bookshelf.push(book)
    return book
  end
end
