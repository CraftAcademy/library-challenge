require('./lib/library')

class Person
  attr_accessor :name, :bookshelf

  def initialize(attrs = {})
    set_name(attrs[:name])
    @bookshelf = []
  end

  def checkout(title, library)
    library.checkout(title, self)
  end

  def book_available(library)
    library.available_books
  end

  private

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end
end
