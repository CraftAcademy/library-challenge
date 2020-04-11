require 'yaml'


class Visitor

    def show_list
         YAML.load_file('./lib/data.yml') 
   
    end

    def search_title(title)
        YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? title }
    end

    def check_status_book(title)
        YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? title }[0][:available]
        
    end

    def check_out_book(title)
        collection = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? title }
        File.open('./lib/visitor_data.yml', 'w') { |f| f.write collection.to_yaml }
    end



end