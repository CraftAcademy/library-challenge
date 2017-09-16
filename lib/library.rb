require 'yaml'

class Library

  attr_reader :book_list

  def initialize
    @book_list = load_yaml
  end

  def load_yaml(file = './lib/collection.yml')
    YAML.load_file(file)
  end

  def write_to_yaml(list, file = './lib/collection.yml')
    File.open(file, 'w') { |item| item.write list.to_yaml }
  end

  def books_available(list)
    yes = select_book(list, :available, true)
    list_books(yes)
  end


  def search_by_author(list, author)
    books = search(list, author, :author)
    list_books(books)
  end

  def search_by_title(list, title)
    books = search(list, title, :title)
    list_books(books)
  end

  def search(list, item, var)
    list.select { |obj| obj[:item][var].downcase.include? item.downcase }
  end

  def books_out(list)
    yes = select_book(list, :available, false)
    list_books(yes)
  end

  def my_books_on_loan(list, name)
    name.downcase!
    my_books = select_book(list, :loanee, name)
    list_books(my_books)
  end

  def select_book(list, variable, item = "")
    list.select { |obj| obj[variable] == item }
  end

  def list_books(file)
    file.each do |book|
      available = book[:available]
      return_date = book[:return_date]
      "#{book[:item][:title]}, By: #{book[:item][:author]}, #{ available ? "available" : return_date}"
    end
  end

  def borrow_a_book(list, book, name)
    borrow_book = sort_book(list, book, :title)
    if borrow_book == nil
      message
    elsif borrow_book[:available] == true
      borrow_book[:return_date] = return_date(Date.today)
      borrow_book[:available] = false
      borrow_book[:loanee] = name
      "The book is available and you need to return it no later than #{borrow_book[:return_date]}"
    else
      "That book is not available until #{borrow_book[:return_date]}"
    end
  end

  def sort_book(list, book, item)
    list.detect { |obj| obj[:item][item].downcase.include? book.downcase}
  end

  def return_a_book(list, book)
    return_book = sort_book(list, book, :title)
    if return_book == nil
      message
    else
      return_book[:available] = true
      if return_book[:return_date] >= Date.today.to_s
        returned(return_book)
        "Thank you for returning the book"
      else
        returned(return_book)
        "There is a 100kr fine for returning the book to late"
      end
    end
  end

  def returned(return_book)
    return_book[:return_date] = nil
    return_book[:loanee] = nil
  end

  def edit_list(list, title, new_title)
    edit = sort_book(list, title, :title)
    edit == nil ? message : edit[:item][:title] = new_title
  end

  def edit_author(list, title, new_author)
    edit = sort_book(list, title, :title)
    edit == nil ? message : edit[:item][:author] = new_author
  end

  def add_book(title, author)
    @book_list << [{ item: { title: title, author: author }, available: true, return_date: nil, loanee: nil }]
  end

  def delete_book(list, book)
    delete = sort_book(list, book, :title)
    list.delete(delete)
  end

  def return_date(date)
    date.next_month.to_s
  end

  def message
    "We dont have that book"
  end
end
