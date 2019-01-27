class Library
    attr_accessor :books

collection = YAML.load_file "books.yml"
subject = data["Book_list"]

def initialize
    @library_account = active
    @title = title #not sure how to link to yaml file
end    

def checkout(title, library_account)#we probably need more attributes but am using 2 for now
    collection.select { |obj| obj[:item][:title].include?"Hallows"}
    case # do we need case here?
    when unavailable?(title, account)
        {status:false, message: 'unavailable', date: Date.today}
    when library_account?(account, borrower)
        {status:nil, message: 'no account', date: Date.today}    
    else
        perform_checkout(title, account)
    end   
    
    def unavailable(title, account)    
        available=false
    end   

    def library_account(account, borrower)
        status=active
    end    
end