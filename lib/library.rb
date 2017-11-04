class Library

attr_accessor :books

  def initialize
    @books = YAML.load_file('./book_list.yml')
  end

  def available_books
    currently_available = Array.new
    currently_available << @books.select { |obj| obj[:book][:available] = true }
  end


end
