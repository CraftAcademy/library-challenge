require 'yaml'
class Library
  attr_accessor :all_books, :available_books
  def initialize
    @all_books = YAML.load_file('./lib/data.yml')
    @available_books = find_available_books
  end

  def find_available_books
    @all_books.select { |book| book[:available] == true }
  end

  def checkout(selected_title)
    selected_book =
      @available_books.find do |book|
        book[:item][:title].include? selected_title
      end

    if selected_book == nil
      return 'This book is not available'
    else
      title = selected_book[:item][:title]
      author = selected_book[:item][:author]
      return_date = Date.today.next_month
      update_yaml_file(title)
      return(
        "Visitor have checked out #{title} by #{author} and will return it before #{return_date} "
      )
    end
  end

  private

  def update_yaml_file(title)
    selected_book = @all_books.detect { |book| book[:item][:title] == title }
    selected_book[:available] = false
    selected_book[:return_date] = Date.today.next_month
    File.open('./lib/data.yml', 'w') { |file| file.write @all_books.to_yaml }
  end
end
