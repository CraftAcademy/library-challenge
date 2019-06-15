
class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file('./lib/inventory.yml')
    end
end