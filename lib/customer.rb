require './lib/library.rb'
# require './lib/library_service.rb'
require 'yaml' 
require 'date'

class Customer
    attr_accessor :collection

    def initialize(attr = {})
      #@book = {:item=>{:title=>"", :author=>""}, :available=>true, :return_date=>nil}   
    end

    def available_books
        collection.select {|book| book[:available].eql? true }
    end

    # def checkout_service(book)
    #     collection[book][:available]= false 
    #     collection[book][:return_date]= set_return_date()
    #     File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    # end 

    # def checkin_service(book)
    #     collection[book][:available]= true 
    #     collection[book][:return_date]= nil
    #     File.open('./lib/inventory.yml', "w") {|f| f.write collection.to.yaml}
    # end
end