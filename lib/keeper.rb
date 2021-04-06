require 'date'
require 'pry'
require 'yaml'
class Keeper
    DATABASE_FILE = './lib/data.yml'
    attr_accessor :books
  
    def initialize
      @books = YAML.load_file(DATABASE_FILE)
    end
  
    def search by
      if by[:title] != nil && by[:author] != nil then
        return @books.select { |book| book[:publication][:title].include?(by[:title]) && book[:publication][:author].include?(by[:author]) }
      end
      if by[:title] != nil then
        return @books.select { |book| book[:publication][:title].include? by[:title] }
      end
      if by[:author] != nil then
        return @books.select { |book| book[:publication][:author].include? by[:author] }
      end
      return []
    end
    def check_out title
      book = fetch_book(title)
      if found_book?(book) then
        return failure_payload('not found')
      elsif not_available_book?(book) then
        return failure_payload('not available')
      else
        checkout_book = perform_checkout(book)
        update_database
        return success_payload(checkout_book)
      end
    end
    def list_of_books
        @books
    end
    private 

  def fetch_book(title)
    @books.detect { |book| book[:publication][:title] == title }
  end

  def found_book?(book)
    book == nil
  end

  def not_available_book?(book)
    book[:available] == false
  end

  def failure_payload(message)
    { status: false, message: message }
  end
<<<<<<< HEAD

=======
>>>>>>> 1d3c190 (failure_payload message and  success payload message added)
  def success_payload(book)
    { status: true, message: 'success', book: book }
  end

<<<<<<< HEAD
  def perform_checkout(book)
    book[:available] = false
    book[:return_date] = Date.today.next_month(1)
    {
      title: book[:publication][:title],
      author: book[:publication][:author],
      return_date: book[:return_date]
    }
    #trying to solve problem
  end
=======
>>>>>>> 1d3c190 (failure_payload message and  success payload message added)
end