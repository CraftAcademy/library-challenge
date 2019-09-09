require './lib/visitor'
require './lib/library'
require 'date'

describe Visitor do
    it 'has a list of checked-out books' do
        subject.book_list 
        expect(subject.book_list).to be include("Pippi Långstrump går ombord")
    end
end