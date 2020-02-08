require 'yaml'

class Library
    attr_accessor :title, :item

    def collection_books
        collection_books = YAML.load_file('./lib/data.yml')
    end

    def title
        collection_books.detect { |obj| obj[:item][:title] == "Alfons och soldatpappan"  }
    end

end
