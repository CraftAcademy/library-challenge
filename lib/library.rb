require 'yaml'
require 'Date'

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
    if [:available] == false
      return 'Sorry this book is out now'
    elsif [:available] == true
      look_up1[:available] = false
      look_up1[:return_date] = set_outdate
      change_books
    end
  end

  def set_outdate
    Date.today + 30
  end

  def books
    YAML.load_file('./lib/books.yml')
  end

  def change_books
    File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
  end
end
