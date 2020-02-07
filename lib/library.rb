require 'yaml'

class Library
   attr_accessor :collection

   DAYS_BEFORE_RETURN = 30

   def collection
    collection = YAML.load_file('./lib/inventory.yml')
   end 
    
end 

