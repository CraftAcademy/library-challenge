class Library
  attr_accessor :all_books, :available_books
  def initialize
    @all_books = YAML.load_file('./lib/data.yml')
    @available_books = find_available_books
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

  def checkout(selected_title)
    selected_book =
      @available_books.find { |book| book[:title].include? selected_title }

    title = selected_book[:title]
    author = selected_book[:author]
    return_date = Date.today.next_month

    return(
      "Visitor have checked out #{title} by #{author} and will return it before #{return_date} "
    )
  end
end
