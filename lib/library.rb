require 'yaml'
require 'date'

class Library
  attr_accessor :available_books, :collection

  def initialize
    # maybe change into ALL Books and create available books with private method below.
    @collection = YAML.load_file('./lib/data.yml')
    @available_books = book_available
  end

  def checkout(title, person)
    if person.bookshelf[0][:return_date] < Date.today
      { status: false,
        message: 'Unavailable to checkout when having overdue books.', date: Date.today }
    else
      title_availability(title) ? successful_checkout(title) : unsuccessful_checkout(title)
    end
    # collection.detect { |book| book[:book][:title] == title }[:available] ? successful_checkout(title) : unsuccessful_checkout(title)
  end

  def add_to_collection(arg = {})
    collection.append({book: {title: arg[:book][:title], author: arg[:book][:author]}, available: true, return_date: ''})
    update_collection
  end

  private

  def book_available
    @collection.select { |book| book[:available] == true }
  end

  def successful_checkout(title)
    collection.detect { |book| book[:book][:title] == title }[:available] = false
    collection.detect { |book| book[:book][:title] == title }[:return_date] = Date.today.next_month
    update_collection
    { status: true, message: "You've checked out #{title}", date: Date.today, return_date: Date.today.next_month }
  end

  def unsuccessful_checkout(title)
    return_date = collection.detect { |book| book[:book][:title] == title }[:return_date]
    { status: false, message: "#{title} is not available, please come back after #{return_date}.", date: Date.today }
  end

  def title_availability(title)
    collection.detect { |book| book[:book][:title] == title }[:available]
  end

  def update_collection
    File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
  end
end
