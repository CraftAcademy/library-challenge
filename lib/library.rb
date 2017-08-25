require 'yaml'

class Library

  attr_reader :book_list

  def initialize
    @book_list = load_yaml('./lib/collection.yml')
  end

  def return_date(date)
    date.next_month
  end

  def load_yaml(file)
    YAML.load_file(file)
  end

  def list_books(file)
    file.each do |book|
      title = book[:item][:title]
      author = book[:item][:author]
      available = book[:available]
      return_date = book[:return_date]
      puts "#{title} #{author} #{ available ? "available" : return_date}"
    end
  end

  def borrow_a_book(list, book)
    borrow_book = list.detect { |obj| obj[:item][:title].include? book}
    if borrow_book[:available] == true
      return_book = return_date(Date.today)
      borrow_book[:available] = false
      "The book is available and you need to return it no later than #{return_book}"
    else
      "That book is not available until #{borrow_book[:return_date]}"
    end
  end
end
# for testing purposes
# lib = Library.new
# booklist = lib.book_list
# lib.list_books(booklist)
