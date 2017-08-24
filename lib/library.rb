
class Library

  def collection
collection = File.open('./lib/book_data.yml', 'w') { |f| f.write collection.to_yaml }
  end

end
