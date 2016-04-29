class Library
    attr_accessor :catalog 
    
    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
    end
end