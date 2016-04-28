class Library
  attr_reader :book_list

  def initialize
    @book_list = [{title: 'Steve Jobs', author:'Walter Isaacsson'},
                {title:'Veg Recipes', author:'Tan Li'},
                {title:'Thinking in C++', author:'Bruce Eckel'}]
  end

  def checkout(book)
    if @book_list.include? book
      @book_list.delete(book)
    else
      expected_output = {status: false, message:'No book is found'}
    end
  end

end
