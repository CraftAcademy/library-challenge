require 'library'
require 'customer'

module Libraryservice
    
    def checkout_service(book)
        collection[book][:available]= false 
        collection[book][:return_date]= set_return_date()
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    end 

    def checkin_service(book)
        collection[book][:available]= true 
        collection[book][:return_date]= nil
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    end
end