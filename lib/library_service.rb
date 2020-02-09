require 'library'
require 'customer'

module Libraryservice
    
    def checkout(book)
        collection[book][:available]= false 
        collection[book][:return_date]= set_return_date()
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    end 

    def checkin(book)
        collection[book][:available]= true 
        collection[book][:return_date]= nil
        File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    end
end