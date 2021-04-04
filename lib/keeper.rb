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

      if by[:title] != nil then
        return @books.select { |book| book[:book][:title].include? by[:title] }
      end
      if by[:author] != nil then
        return @books.select { |book| book[:book][:author].include? by[:author] }
      end
    end

    def list_of_books
        @books
    end



    
    
end