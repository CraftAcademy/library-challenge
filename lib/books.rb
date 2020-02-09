require 'yaml'

class Books
    attr_accessor :item

    def initialize
    @item = YAML.load_file('./lib/data.yml')
    end

    def query_title(title)
        item.select { [:item][:title].include? "#{title}" }
    end

    def query_author(author)
        item.select { [:item][:author].include? "#{author}" }
        #@item = file.open('./lib/data.yml'), 'r') { |f| f.read collection.to_yaml }
    end

    def check_availability
        item.select { [:available]}
        #@item = file.open('./lib/data.yml'), 'r') { |f| f.read collection.to_yaml }
    end

end