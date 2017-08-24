
class Library

  attr_accessor :collection

  def initialize
    @collection = File.open('./lib/book_data.yml', 'w') { |f| f.write collection.to_yaml }
  end

end
