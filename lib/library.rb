# frozen_string_literal: true

require 'yaml'

class Library
  attr_accessor :books, :all_books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
    @lib_name = 'Bibblan'
  end

  def list_books
    @all_books = []

    books.each do |book|
      book_title = book[:item][:title]
      book_author = book[:item][:author]
      available = book[:available] ? 'Availible' : 'Not availible'
      @all_books << "#{book_title} - #{book_author} - #{available}"
    end
    @all_books
  end

  def search(title)
    @books.select do |book|
      book[:item][:title] == title
    end
  end

  def checkout(title)
    book_checkout = @books.select do |book|
      book[:item][:title].include? title
    end
    if book_checkout[0][:available] == true
      book_checkout[0][:available] = false
      book_checkout[0][:return_date] = Date.today >> 1
      File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
      File.open('./lib/receipt.yml', 'w') { |f| f.write book_checkout.to_yaml }
    else raise 'Sorry, book is unavailable!'
      end
  end
end
