class Library
    attr_accessor :catalog 
    
    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        #require 'yaml'
        #catalog.each do |available|
        #print
    #end
    end
    #puts catalog.inspect
end