require 'yaml'
require './lib/library'
require 'date'

describe Library do
    let(:person) { instance_double('Person') }

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

    it 'set the availability on an item' do
        expect(subject.set_available).to eq false
    end

    it 'set the return date one month from loan date' do
        return_date = Date.today.next_month.strftime('%F')
        expect(subject.set_return_date).to eq return_date
    end

    it 'create new array with books person loaned' do
    end

end
