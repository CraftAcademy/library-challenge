require 'date'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def search(args = {})
      if args[:title] and args[:author] != nil
        search_title(args) && search_author(args)
      elsif args[:available] != nil
        search_available(args)
      elsif args[:title] != nil
          search_title(args)
        elsif args[:author] != nil
          search_author(args)
      end
  end

  def checkout(title, person)
   perform_checkout(title, person)
  end

  private

  def perform_checkout(title, person)
    @books.each do |book|
      if book[:item][:title] == title && !book_unavailable(book)
        change_status(book)
        person.my_books << book.reject{|key| key == :available}
      elsif book[:item][:title] == title && book_unavailable(book)
        puts error(book)
      end
    end
  end

  def change_status(book)
    book[:available] = false
    book[:return_date] = set_return_date
    File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
  end

  def book_unavailable(title)
    title[:available] == false
  end

  def error(title)
    "#{title[:item][:title]} is currently not available"
  end

  def search_title(args)
      @books.select { |book| book[:item][:title].include? args[:title]}
  end

  def search_author(args)
    @books.select { |book| book[:item][:author].include? args[:author]}
  end

  def search_available(args)
    @books.select { |book| book[:available] == args[:available]}
  end

  def set_return_date
    Date.today.next_month(1).strftime('20%y-%m-%d')
  end
  # def book_unavailable?(book)
  #   @books[book_num][:available] == false
  # end
end
