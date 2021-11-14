require "./lib/book.rb"
require "yaml"

class Library
  attr_accessor :book, :available, :return_date

  def create_book(args = {})
    @book = Book.new({ title: args[:title], author: args[:author] })
  end

  def add_book_to_inventory(available = true, return_date = nil)
    @book.nil? ? missing_book : add_book_to_yml_file(available, return_date)

    {
      status: true,
      message: "#{@book.title} by #{@book.author} added to the inventory"
    }
  end

  private

  def missing_book
    raise "A book is required"
  end

  def add_book_to_yml_file(available, return_date)
    @available = available
    @return_date = return_date

    new_book = {
      book: { title: @book.title,
              author: @book.author },
      available: @available,
      return_date: @return_date,
    }
    array = load_yml_file
    array.push new_book
    write_to_yml_file(array)
  end

  def load_yml_file
    YAML.load_file("./library_data.yml")
  end

  def write_to_yml_file(array)
    File.open("./library_data.yml", "w") { |file| file.write(array.to_yaml) }
  end
end
