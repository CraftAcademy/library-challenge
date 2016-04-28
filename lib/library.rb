class Library
  attr_reader :book_list
  
  def initialize
    @book_list = [{title: 'Steve Jobs', author:'Walter Isaacsson'},
                {title:'Veg Recipes', author:'Tan Li'},
                {title:'Thinking in C++', author:'Bruce Eckel'}]

  end

end
