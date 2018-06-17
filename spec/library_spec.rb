require 'yaml'
require './lib/library'

describe Library do

    it 'make a Library with books' do
        expect(subject).to be_an_instance_of Library
    end

    it 'search for title in the inventory' do
        expected_array = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.find_book_title('Pippi')).to eq(expected_array)
    end

    it 'search for author in inventory' do
        expected_array = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
        {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"},
        {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"},:available=>true, :return_date=>nil}]
        expect(subject.find_book_author('Gunilla')).to eq(expected_array)
    end

    xit ' write to the database so it can set availablity, return date add new books' do

    end

    xit 'tell person if book is over due' do
    
    end

end
