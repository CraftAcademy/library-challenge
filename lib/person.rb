require 'yaml'

class Person

  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')

  end

  def book_list
    list = @books
    list.select { |obj| obj[:available] == false  }
  end

  def person_checkout(library, book)
    library.person_checkout(book)
  end

end
