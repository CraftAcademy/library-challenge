require 'yaml'

class Individual
  attr_accessor :borrowed_books, :name

  def initialize
    @borrowed_books = YAML.load_file('./lib/borrowed_books.yml')
    @name = 'Philip Testing'
  end
#
#   def borrow(book_title, (library))
#     if @name == nil
#       raise 'You need a name in order to borrow a book'
#     else
#     (library).borrow(book_title, self)
#     @borrowed_books.map do |obj|
#       obj[:title] = (book_title)
#       obj[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
#     end
#     File.open('./lib/borrowed_books.yml', 'w') { |f| f.write @borrowed_books.to_yaml }
#   end
# end
#
#   def return(book_title, (library))
#     (library).return(book_title)
#     @borrowed_books.map do |obj|
#       obj[:title] = nil
#       obj[:return_date] = nil
#     end
#     File.open('./lib/borrowed_books.yml', 'w') { |f| f.write @borrowed_books.to_yaml }
#   end
# end
