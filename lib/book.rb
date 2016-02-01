class Book
attr_accessor :title, :author

 def initialize(title, author)
    @title = title
    @author = author
 end

# def search_by_title(title)
#  books.detect{|a| a[:title] == title}
# end

  #def search_by_author(author)
  #  books.detect do |book|
  #      book[:author] == author
  #     end
  #  end
end
