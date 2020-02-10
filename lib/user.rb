require './lib/account'
require './lib/books'
require 'yaml'
require 'pry'

class User
    attr_accessor :account, :id, :book_list
    
    def initialize (attrs = {})
        @account == nil
        @id = rand(1000..9999)
        @book_list = []
    end
    
    def create_account
        @account = Account.new(owner: self)
    end

end