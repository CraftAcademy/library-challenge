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
        return @books.select { |book| book[:book][:title].include?(by[:title]) && book[:book][:author].include?(by[:author]) }
      end
      if by[:title] != nil then
        return @books.select { |book| book[:book][:title].include? by[:title] }
      end
      if by[:author] != nil then
        return @books.select { |book| book[:book][:author].include? by[:author] }
      end
      return []
    end
    def check_out book
        book = fetch_book(book)
        if found_book?(book) then
          return failure_payload('not found')
        else not_available_book?(book) then
          return failure_payload('not available')
    end
    def list_of_books
        @books
      end
end