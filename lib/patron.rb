require 'yaml'
require 'pry'

class Patron
  attr_accessor :borrowed_books

  def initialize
    @borrowed_books = YAML.load_file('./lib/borrowed_books.yml')
  end

  def borrow(title)
    books = YAML.load_file('./lib/data.yml')
    book = books.detect { |obj| obj[:item][:title].include? (title) }
    @borrowed_books[0][:return_date] = Date.today.next_month(1).strftime('%d/%m')
    @borrowed_books[0][:item][:title] = book[:item][:title]
    @borrowed_books[0][:item][:author] = book[:item][:author]
    File.open('./lib/borrowed_books.yml', 'w') { |f| f.write @borrowed_books.to_yaml }
  end

end
