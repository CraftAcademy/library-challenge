require 'yaml'

class Person

  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end

  def borrowd_book_list
    @books.select { |obj| obj[:available] == false  }.each {|val| puts val }
  end


end
