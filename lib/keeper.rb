require 'date'
require 'pry'
require 'yaml'
require './lib/keeper.rb'
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
end