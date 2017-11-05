class Library
  attr_accessor :collection
  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def checkout_book(book, person)
    book[:available] = false
    person.books << book[:item]
  end
end
