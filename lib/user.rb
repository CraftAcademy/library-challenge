require './lib/account'
require './lib/books'
require 'pry'

class User
    attr_accessor :account, :id, :item

    def initialize (attrs = {})
        @account == nil
        @item = nil
        @id = rand(1000..9999)
    end
    
    def create_account
        @account = Account.new(owner: self)
    end

    # def return(item)
    #     @account == nil ? missing_account : deposit_funds(amount)
    # end

    # def checkout(args = {})
        
    #     item.each do |book| book{ [:item][:available] ==  false }
    #     end 
    #     #@account == nil ? missing_account : checkout_book(args)
    # end

    def checkout(item)
        # item.select { [:item][:available].eql? true }
        @item = YAML::load_file('./lib/data.yml') #Load
        @item[0][:available] = false #Modify
        File.write('./lib/data.yml', item.to_yaml) #Store
        #File.open('./lib/data.yml', 'w') {|f| f.write item.to_yaml } #Store
       # @item = file.open('./lib/data.yml'), 'r') { |f| f.read collection.to_yaml }
    end

    # def checkout_book(args)
    #     args[:item] == nil ? missing_atm : args[:item] = Books
    #     amount = args[:amount]
    #     pin = @account.pin_code
    #     account = @account
    #     @cash += args[:amount]
    #     @account.balance -= args[:amount]
    # end

private


# def missing_account  
#     raise RuntimeError, 'No account present'
# end


end

# set_id(attrs[:id])

        #@item = YAML.load_file('./lib/data.yml')
        # @item = collection[0][:available]= false
        # file.open('./lib/data.yml'), 'w') { |f| f.write item.to_yaml }