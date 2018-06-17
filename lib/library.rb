require 'yaml'
require 'date'

class Library
    attr_accessor :inventory

    def initialize
        @inventory = YAML.load_file('./lib/data.yml')
    end

    def find_book(args={})
        @inventory.select { |obj| obj[:item][:title].include? args }
    end

end

