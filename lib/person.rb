require './lib/library.rb'
require 'date'
require 'yaml'

class Person
    attr_accessor :name
    def initialize
        @name = name
    end

def show_books
    books = YAML.load_file('./lib/data.yml')
    available_books = books.select { |obj| obj[:available] == true }
end
end

