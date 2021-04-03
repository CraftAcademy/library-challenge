class Library 

  def initialize
    @book_list
  end

  def read_book_list
    YAML.load_file('./lib/books.yml')
  end
end