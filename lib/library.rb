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

  def my_books_on_loan(list, name)
    my_books = list.select { |obj| obj[:loanee] }
    list_books(my_books)
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

  def borrow_a_book(list, book, name)
    borrow_book = list.detect { |obj| obj[:item][:title].include? book}
    if borrow_book[:available] == true
      borrow_book[:return_date] = return_date(Date.today)
      borrow_book[:available] = false
      borrow_book[:loanee] = name
      "The book is available and you need to return it no later than #{borrow_book[:return_date]}"
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
        return_book[:loanee] = nil
        return_book[:return_date] = nil
        "Thank you for returning the book"
      else
        return_book[:return_date] = nil
        return_book[:loanee] = nil
        "There is a 100kr fine for returning the book to late"
      end
    end
  end

  def edit_list(list, title, new_title)
    edit = list.select { |obj| obj[:item][:title] == title }
    edit[0][:item][:title] = new_title
  end
end

lib = Library.new
lib.load_yaml
lib.list_books(lib.book_list)
puts ""
puts ""
