require 'yaml'
require 'date'

class Library
  attr_accessor :books, :file_name

  def initialize(file_name)
    @books = YAML.load_file('./lib/data.yml')
    @file_name = file_name + '_data.yml'
    write_to_yaml
  end

  def books_available
    @books.select { |x| x[:available] == true }
  end

  def checkout(id, person)
    index = find_index(id)
    if @books[index][:available] == true
      @books[index][:available] = false
      @books[index][:person] = person.name
      @books[index][:item][:return_date] = Date.today.next_day(30).strftime('%Y-%m-%d')
      person.books << @books[index][:item]
      write_to_yaml
      @books[index][:item][:title] + ' checked out successfully, please return on ' + @books[index][:item][:return_date]
    else
      "Book not available"
    end
  end

  def return_date(id)
    index = find_index(id)
    @books[index][:item][:return_date]
  end

  def return(id,person)
    index = find_index(id)
    if @books[index][:available] == true
      'This book has already been returned'
    elsif person.name != @books[index][:person]
      'This book has been checked out by a different person'
    else
    @books[index][:available] = true
    @books[index][:person] = nil
    @books[index][:item][:return_date] = nil
    person.books.reject! { |x| x[:id] === id }
    write_to_yaml
    'Thanks for returning ' + @books[index][:item][:title]
    end
  end

  def add_book(title, author)
    id = @books.size + 1
    new_book = {item: {id: id, title: title, author: author, return_date: nil}, available: true, person: nil}
    @books << new_book
    write_to_yaml
  end

  private

  def find_index(id)
    @books.index { |x| x[:item][:id] === id }
  end

  def write_to_yaml
    File.open('./lib/' + @file_name , 'w') { |f| f.write @books.to_yaml }
  end
end
