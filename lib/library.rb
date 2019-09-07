require 'yaml'

class Library
    attr_accessor :booklist

    def initialize
        @booklist = load_yaml
    end

    private

    def load_yaml
       YAML.load_file('./lib/data.yml')
    end
end