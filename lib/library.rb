class Library
    attr_accessor :catalog 
    
    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        require 'yaml'
    end
    
    def checkout(item) 
        case 
        when already_checked_out(item) then
            'Tyvärr, boken är utlånad.'
        else
            perform_transaction(item)
        end
    end
end
   #     File.open('./lib/catalog.yml', 'w') { |f| f.write @catalog.to_yaml }
    #end


private

    def already_checked_out(item)
        item[:available] == false
    end
        
    #def perform_transaction(item)
    #    'Tack för att du lånar hos oss. Boken ska återlämnas inom en månad'
    #    item[:available] = false
    #    item[:return_date] = return_date_set 
    #end 
    
    def return_date_set(item)
        return_date = Date.today + 30
    end 

  
    #catalog.select { |obj| obj[:item][:title].include? "Yadaydaya" }
    #catalog.select { |obj| obj[:item][:author].include? "Yadaydaya" }
