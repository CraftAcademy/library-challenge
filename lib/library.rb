class Library

attr_accessor :books

  def initialize
    @books = YAML.load_file('./book_list.yml')
  end

  def books_available
    @books.select { |obj| obj[:book][:available] = true }
  end


  # private

  # def book_is_available?(title)
  #   :available == true
  # end

end
