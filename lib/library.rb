class Library
  attr_accessor :book_list

  def initialize
    @book_list = YAML.load_file('./lib/book_collection.yml')
  end

  def book_selection
    @book_list
  end

  def show_books
    @book_list.each do |book|
      puts "{[:item][:title]}"
    end
  end

end
