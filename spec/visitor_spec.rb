require './lib/visitor'
require './lib/library'
require 'date'

describe Visitor do
    it 'has a list of checked-out books' do
        expect(book_list).to include{"Pippi Långstrump går ombord"} 
    end
end