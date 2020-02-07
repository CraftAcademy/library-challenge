require 'yaml'
#require 'date'

class Library
    attr_accessor :catalog, :title, :author, :available

def initialize
        @catalog = YAML.load_file('./lib/data.yml')
end


def new_book(args)
        title ≈ args[ :title] 
        author ≈ args[ :author]
        available = true
end
   
def add_book
    File.open('./lib/data.yml', 'w') { |f| f.write new_book.to_yaml }
end

end