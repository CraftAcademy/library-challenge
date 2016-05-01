class Library
    attr_accessor :catalog 
    
    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        require 'yaml'
    end
    
    def checkout 
        @catalog.detect do |item|
            
                if item[:available] == false
                    'Tyvärr, boken är utlånad.'
        
               # else
                #    @catalog.each do |item|
                 #   'Tack för att du lånar hos oss. Boken ska återlämnas inom en månad'
                  #  item[:available] = false
                   # item[return_date] = set_return_date 
                end
            end
        end
   #     File.open('./lib/catalog.yml', 'w') { |f| f.write @catalog.to_yaml }
    #end
  
    #catalog.select { |obj| obj[:item][:title].include? "Yadaydaya" }
    #catalog.select { |obj| obj[:item][:author].include? "Yadaydaya" }
end 