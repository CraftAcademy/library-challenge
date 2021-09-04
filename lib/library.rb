require 'yaml'
require 'date'

class Library
  attr_accessor :available_books

  def initialize
    # maybe change into ALL Books and create available books with private method below.
    @collection = YAML.load_file('./lib/data.yml')
    @available_books = book_available
  end

  def checkout(title)
    successful_checkout = { status: true, message: 'Enjoy', date: Date.today, exp_date: Date.today.next_month }
    unsuccessful_checkout = { status: false, message: 'Not available', date: Date.today }
    available_books.any? { |book| book[:book][:title] == title } ? successful_checkout : unsuccessful_checkout
  end

  private

  def book_available
    @collection.select { |book| book[:available] = true }
  end
end
