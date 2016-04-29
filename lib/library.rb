class Library
  attr_accessor :catalog

  def initialize
    @catalog = YAML.load_file('./lib/catalog.yml')
  end

  def checkout(book)
    book[:available] = false
  end

end
