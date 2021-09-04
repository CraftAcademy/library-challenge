require 'yaml'

class Library 


  def available_books
    collection = YAML.load_file('./lib/data.yml')
    collection
  end

end
