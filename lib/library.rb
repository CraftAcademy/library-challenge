class Library
  attr_accessor :collection

  def initialize
    @collection = load_collection
  end
  # def collection_present
  #   if YAML.load_file('./lib/data.yml')
  #    return true 
  #   end
  # end

  def load_collection
    collection = YAML.load_file('./lib/data.yml')
    collection.length.nil? ? 'No books in the library' : collection
  end
  
  def view_collection
    @collection.each {|key, value| puts "#{key[:item][:title]} : #{key[:item][:author]}"}
  end

  def search(search_title)
    title = @collection.select { |obj| obj[:item][:title].include?search_title }
    title[0]
  end

end
