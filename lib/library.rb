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
    item_title = @collection.select { |obj| obj[:item][:title].include?search_item }
    item_author = @collection.select { |obj| obj[:item][:author].include?search_item }
    if item_title.length == 0 && item_author.length == 0
       return 'no such book'
    elsif item_title.length == 0
      return item_author
    else 
      return item_title 
    end
    
  end

end
