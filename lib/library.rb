require 'yaml'

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
    @person = YAML.load_file('./lib/person.yml')
  end

  def all_books
    @books.to_a.each {|val| puts val }
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }
  end
end
