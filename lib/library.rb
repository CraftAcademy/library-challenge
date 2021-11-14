require "./lib/book.rb"

class Library
  attr_accessor :book, :available, :return_date

  def create_book(args = {})
    @book = Book.new({ title: args[:title], author: args[:author] })
  end

  def add_book_to_inventory(available = true, return_date = "")
    @book == nil? ? missing_book : add_book_to_yml_file(available, return_date)
    
    response = {
      status: true,
      message: "#{@book.title} by #{@book.author} added to the inventory"
    }
    # if book_missing?
    # else
    #   @available = available
    #   @return_date = return_date
    # end
  end

  private

  def missing_book
    raise "A book is required"
  end

  def add_book_to_yml_file(available, return_date)
    @available = available
    @return_date = return_date
  end
end
