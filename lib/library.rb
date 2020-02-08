require 'yaml'

class Library

    attr_accessor :books_list

    def initialize

    @books_list = YAML.load_file('./lib/data.yml')   

    end
end
