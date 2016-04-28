class Library
  LOAN_DURATION = 30
  attr_reader :book_list

  def initialize
    @book_list = [{title: 'Steve Jobs', author:'Walter Isaacsson'},
                {title:'Veg Recipes', author:'Tan Li'},
                {title:'Thinking in C++', author:'Bruce Eckel'}]
  end

  def checkout(book)
    if @book_list.include? book
      @book_list.delete(book)
      return_date = Date.today + Library::LOAN_DURATION
      {status: true, book: book, return_date: return_date.strftime("%d/%m/%y")}
    else
      {status: false, message:'No book is found'}
    end
  end

end
