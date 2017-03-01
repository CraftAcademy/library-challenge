require 'yaml'

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
    @person = YAML.load_file('./lib/person.yml')
  end

  def available_books
    @books.select { |obj| obj[:available] == true  }.each {|val| puts val }
  end

  def test
    @ebook = @books[2][:item]
  end

  def all_books
   @books.each {|val| puts val }
  end

  def person_checkout(book_id)
    book_id -=1
    date = Date.today + 30
    @books[book_id][:available] = false
    @books[book_id][:return_date] = date.to_s
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    @person[book_id][:available] = false
    @person[book_id][:return_date] = date.to_s
    File.open('./lib/person.yml', 'w') { |f| f.write @person.to_yaml }
  end

  def return_book(book_id)
    book_id -=1
    @books[book_id][:available] = true
    @books[book_id][:return_date] = 'in_house'
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    @person[book_id][:available] = true
    @person[book_id][:return_date] = 'in_house'
    File.open('./lib/person.yml', 'w') { |f| f.write @person.to_yaml }
  end
end
