class Library
    attr_accessor :catalog 
    
    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        require 'yaml'
    end
    
    def checkout(book) 
        case 
        when already_checked_out(book) then
            'Tyvärr, boken är utlånad.'
        else
            perform_transaction(book)
                end
            end
        end
   #     File.open('./lib/catalog.yml', 'w') { |f| f.write @catalog.to_yaml }
    #end


private

    def already_checked_out(book)
        item[:available] == false
    end
        
    def perform_transaction(book)
        'Tack för att du lånar hos oss. Boken ska återlämnas inom en månad'
        item[:available] = false
        item[:return_date] = set_return_date 
    end 
    
    def set_return_date(book)
        return_date = Date.today + 30
    end 

  
    #catalog.select { |obj| obj[:item][:title].include? "Yadaydaya" }
    #catalog.select { |obj| obj[:item][:author].include? "Yadaydaya" }
