require 'library'
require 'customer'

module Libraryservice
    
    def checkout(index)
        collection[index][:available]= false 
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    end 

    def checkin

    end
end