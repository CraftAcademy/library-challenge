require 'yaml'
require './lib/library'

describe Library do

    it 'make a Library with books' do
        expect(subject).to be_an_instance_of Library
    end

    it 'search for books in the inventory' do
        expected_array = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.find_book('Pippi')).to eq(expected_array)
    end

    xit ' write to the database so it can set availablity, return date add new books' do

    end

    xit 'tell person if book is over due' do
    
    end

end
