class Books
 attr_accessor :title, :author

# Books = [{title: @title, author: @author}]

 def initialize(options={})
    @title = title
    @author = author
#  Books = [{title: @title, author: @author}]
  end

  def search_by_title(title)
    book.detect{|a| a[:title] == title}
    end

  def search_by_author(author)
    books.detect do |book|
        book[:author] == author
       end
    end
end
