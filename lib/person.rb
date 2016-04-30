require './lib/library.rb'
class Person
  def initialize

  end

  def checkout(args)
    library = args[:lib]
    title = args[:title]
    library.checkout(title)
  end
end
