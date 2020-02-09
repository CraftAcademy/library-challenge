require './lib/account'
require './lib/books'
require 'pry'

class User
    attr_accessor :account, :id, :book

    def initialize (attrs = {})
        @account == nil
        @book = nil
        @id = rand()
    end

end

# set_id(attrs[:id])