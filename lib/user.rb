class User
  attr_accessor :books

  def initialize
    @books = nil
  end

  def borrowed_books
    puts books
  end
end
