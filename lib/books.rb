require 'yaml'

class Books
    attr_accessor :catalog

    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
    end

    def query_title(user_search)
        @book = catalog.select { |obj| obj[:item][:title].include? user_search }
    end

    def query_author(user_search)
        @book = catalog.select { |obj| obj[:item][:author].include? user_search }
    end 

end