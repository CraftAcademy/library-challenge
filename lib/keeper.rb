require 'date'
require 'pry'
require 'yaml'
require './lib/keeper.rb'

class Keeper
    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
    end

end