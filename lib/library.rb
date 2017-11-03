class Library
  attr_accessor :book_list

  def initialize
    @book_list = YAML.load_file('./lib/book_collection.yml')
  end

  def book_selection
    @book_list
    book_list.each do |title, author|
      puts "{[:item][:title]}, {[:item][:author]} "
    end
  end

end
