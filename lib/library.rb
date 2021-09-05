require 'yaml'
require 'date'

class Library
  attr_accessor :list_of_books

  def initialize
    @list_of_books = YAML.load_file('./lib/base_data.yml')
  end

  def search_for_title(title)
    list_of_books.detect { |obj| obj[:book][:title].include? title }
  end

  def search_for_author(author)
    list_of_books.select { |obj| obj[:book][:author].include? author }
  end

  def checkout_book(title)
    if search_for_title(title)[:available] == false
      'book unavailable'

    else
      search_for_title(title)[:available] = false

      search_for_title(title)[:return_date] = Date.today.next_month

      File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }
      list_of_books.detect { |obj| obj[:book][:title].include? title }

    end
  end
  
  def return_book(title)
    search_for_title(title)[:available] = true

      search_for_title(title)[:return_date] = nil

      File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }
      list_of_books.detect { |obj| obj[:book][:title].include? title }
  end

  def list_available_books
    list_of_books.select { |obj| obj[:book][:available] == true }
  end
end
