class Person
attr_accessor :books, :name, :personnummer

  def initialize(name, personnummer)
    @name = name
    @personnummer = personnummer
    @books = []
  end

end
