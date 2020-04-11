class Library
  attr_accessor :collection

  def initialize
    @collection = load_collection
  end
  
  def load_collection
    collection = YAML.load_file('./lib/data.yml')
    collection.length.nil? ? 'No books in the library' : collection
  end
  
  def view_collection
    @collection.each {|key, value| puts "#{key[:item][:title]} : #{key[:item][:author]}"}
  end

  def search(search_item)
    item = @collection.select { |obj| obj[:item][:title].include?search_item }
    if item.length == 0 
      item = @collection.select { |obj| obj[:item][:author].include?search_item }
    end
    return item 
  end

end
