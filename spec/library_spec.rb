require './lib/library.rb'

describe Library do

    it 'has books' do
        expect(subject.collection).not_to be_empty
    end

    it 'has a list of books' do
        expect(subject.collection).to be_a_kind_of(Array)
    end 

    it 'shows a list of available books to customer' do
        books_array = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"}] 
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}]
        expect(subject.display_available_books(books_array)).to eq expected_output
    end

    it 'allows an individual to select a book from availble book list' do
        books_array = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}] 
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}]
        expect(subject.select_book(books_array,'1')).to eq expected_output
    end 

end