require 'yaml'

class Library
  attr_accessor :books


  def list_available
    books.select { |obj| obj[:available] == true }
  end

  def list_all
    books.select { |obj| obj[:item] }
  end

  def search_books
    puts 'look up a book'
    look_up = gets.chomp!
    look_up1 = books.index { |each| each == look_up }
    books.bsearch { |obj| obj[:item][:title]; look_up1}
  end

  def books
    YAML.load_file('./lib/books.yml')
  end
end
