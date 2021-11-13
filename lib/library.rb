class Library
  attr_accessor :all_books
  def initialize
    @all_books = YAML.load_file('./lib/data.yml')
  end

  def find_available_books
    available_books = []
    available_books_all_fields =
      @all_books.select { |book| book[:available] == true }
    available_books_all_fields.each do |book|
      author_and_title_only = {
        author: book[:item][:author],
        title: book[:item][:title],
      }
      available_books.push(author_and_title_only)
    end
    return available_books
  end
end
