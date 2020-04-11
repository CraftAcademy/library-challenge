class Person
    attr_accessor :name, :receipts
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @receipts = []
    end

    

    private

    def set_name(name)
        name.nil? ? (raise 'Person must have a name') : name
    end
end