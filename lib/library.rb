require 'data.yml'
require './lib/library.rb'

class Library
    attr_accessor :books
    def initalize
        @books = YAML.load_file('./lib/data.yml')
    end
end
