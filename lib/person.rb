require 'yaml'

class Person

  attr_accessor :books

  def initialize
    @persons = YAML.load_file('./lib/person.yml')
    @books = YAML.load_file('./lib/data.yml')
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end

  def borrowd_book_list
    @persons.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end
end
