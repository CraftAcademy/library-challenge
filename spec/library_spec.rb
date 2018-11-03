require './lib/library.rb'

describe Library do

    let(:customer) { instance_double('Person', user_id: '123456', pin_code: '1234',reading_list: [] )}

    it 'has books' do
        expect(subject.collection).not_to be_empty
    end

    it 'has a list of books' do
        expect(subject.collection).to be_a_kind_of(Array)
    end 

    # As a library
    # In order to have good books to offer to the public
    # I would like to be able to allow individuals to check out a book

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

    it 'allows an individual to check out a book' do
        selected_book = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> '2018-12-03'}
        expect(subject.book_checkout(selected_book,'123456','1234', customer)).to eq expected_output
    end

    it 'when a person checks out a book, it is added to the reading list' do
        selected_book = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> '2018-12-03'}]
        subject.book_checkout(selected_book,'123456','1234', customer)
        expect(customer.reading_list).to eq reading_list
    end

end