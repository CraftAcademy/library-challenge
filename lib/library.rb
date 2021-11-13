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

    #if selected_book != nil
    #  title = selected_book.title

    # @available_books.select { |book| book[:title].include? selected_title }

    #author = @available_books.select { |book| book[:item][:author].include?  }
    # return_date = Date.today.next_month
    # puts "You have checked out #{title} by #{author} and you need to return it before #{return_date} "
    # update file(return_date and false_to_available)
    #else
    #  puts "#{title} by #{author} is currently not available "
    #end
  end

  #private

  #def available?(selected)
  #  @search_results =
  #   @all_books.select { |book| book[:item][:title].include? selected }
  # @search_results == [] ? false : true
  #end
end
