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
    @bookshelf.push(book[:book])
    save_to_disk
    return book[:book]
  end

  def return_book(args)
    args[:lib].nil? ? ErrorHandler.alert('The library does not exist'): library = args[:lib]
    title = args[:title]
    book = library.return_book(title)
    if book != nil
      @bookshelf.delete(book)
      save_to_disk
      return @bookshelf.length
    end
  end

  private
  def save_to_disk
    File.open('./lib/my_bookshelf.yml', 'w') { |f| f.write @bookshelf.to_yaml }
  end
end
