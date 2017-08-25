require 'yaml'

class Library

  attr_reader :book_list

  def initialize

  end

  def return_date(date)
    date.next_month
  end

  def load_yaml(file = './lib/collection.yml')
    @book_list = YAML.load_file(file)
  end

  def write_to_yaml(list, file = './lib/collection.yml')
    File.open(file, 'w') { |item| item.write list.to_yaml }
  end

  def book_available(list)
    yes = list.select { |obj| obj[:available]}
    list_books(yes)
  end

  def books_out(list)
    yes = list.select { |obj| obj[:available] == false}
    list_books(yes)
  end

  def list_books(file)
    file.each do |book|
      title = book[:item][:title]
      author = book[:item][:author]
      available = book[:available]
      return_date = book[:return_date]
      "#{title} #{author} #{ available ? "available" : return_date}"
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

  def return_a_book(list, book)
    return_book = list.detect { |obj| obj[:item][:title].include? book}
    if return_book[:available] == true
      "That book was not borrowed from here"
    else
      return_book[:available] = true
      if return_book[:return_date] >= Date.today.to_s
        return_book[:return_date] = nil
        "Thank you for returning the book"
      else
        return_book[:return_date] = nil
        "There is a 100kr fine for returning the book to late"
      end
    end
  end
end
# for testing purposes
lib = Library.new
booklist = lib.book_list
# lib.list_books(booklist)
