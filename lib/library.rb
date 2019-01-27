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
private
    def search_title (list)
        list.select { |book| book[:item][:title].include? book  }
    end
end