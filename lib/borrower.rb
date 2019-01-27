class Person
    attr_accessor :name, :account

    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @account = nil
    end

    def set_name(name)
        name == nil ? missing_name : name
    end
    
    def create_account
        @account = Account.new(owner: self)
    end