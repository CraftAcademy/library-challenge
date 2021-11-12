class Library
  attr_accessor :all_books
  def initialize
    @all_books = YAML.load_file('./lib/data.yml')
  end
end
