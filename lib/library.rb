class Library

attr_accessor :books

def initialize

@books = YAML.load_file('./book_list.yml')

end

end
