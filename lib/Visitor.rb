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
        book_to_checkout = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? title }
        book_to_checkout[0][:available] = false

        File.open('./lib/data.yml', 'w') { |f| f.write book_to_checkout.to_yaml }
        File.open('./lib/visitor_data.yml', 'w') { |f| f.write book_to_checkout.to_yaml }

    end



end