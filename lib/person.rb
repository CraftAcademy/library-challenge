class Person
attr_accessor :books, :name, :personnummer

  def initialize(name, personnummer)
    @name = name
    @personnummer = personnummer
    @books = []
  end

  def return(id)
    @books.reject! { |x| x[:id] === id }
  end
end
