require 'yaml'

module SearchService
    attr_accessor :collection, :search_word,

    def self.find_title(search_word)
        collection = YAML.load_file('./lib/inventory.yml')
        collection.select {|book| book[:item][:title].include? search_word}
    end

    def self.find_author(search_word)
        collection = YAML.load_file('./lib/inventory.yml')
        collection.select {|book| book[:item][:author].include? search_word}
     end

end
