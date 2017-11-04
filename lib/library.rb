require "yaml"

class Library

  attr_accessor :books

  def initialize
    @books = YAML.load_file("./lib/data.yml")
    checkout_duration
  end

  def record
    record
  end

  def checkout_duration(book_id, checkout_time)
  end


end
