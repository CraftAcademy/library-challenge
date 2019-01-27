require 'yaml'

class Library
    attr_accessor :list, :available  
    def initialize(attrs = {})
        @list = YAML.load_file('./lib/data.yml')
        @available = true
    end

    def incorrect_name? (name, actual_name)
        if（name == actual_name）
            return true
        else
            return false
        end

    def search_title title
            @list.detect { |obj| obj[:item][:title] == title  }
        end
end