require 'yaml'

class Visitor

    def show_list
        YAML.load_file('./lib/data.yml')
    end

    def search_title(title)
        YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? title }
    end
end