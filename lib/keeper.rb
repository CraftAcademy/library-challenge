require 'date'
require 'pry'
require 'yaml'
require './lib/keeper.rb'

class Keeper
    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
    end
    def check_availability(title)
        book = @list.detect { |hash| hash[:book][:title] == title }
        book[:available]
    end
end