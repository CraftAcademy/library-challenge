require 'yaml'
require 'date'

class Library
  attr_accessor :available_books, :collection

  def initialize
    # maybe change into ALL Books and create available books with private method below.
    @collection = YAML.load_file('./lib/data.yml')
    @available_books = book_available
  end

  def checkout(title)
    collection.detect { |book| book[:book][:title] == title }[:available] ? successful_checkout(title) : unsuccessful_checkout(title)
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
    { status: false, message: "#{title} is not available, please come back after #{return_date.strftime('%D')}.", date: Date.today }
  end

  def update_collection
    File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
  end
end
