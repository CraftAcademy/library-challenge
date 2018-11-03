require './lib/library.rb'

describe Library do

    let(:customer) { instance_double('Person', user_id: '123456', pin_code: '1234',reading_list: [] )}

    # As a library
    # In order to have good books to offer to the public
    # I would like to be able to have a collection of books

    it 'has books' do
        expect(subject.collection).not_to be_empty
    end

    it 'has a list of books' do
        expect(subject.collection).to be_a_kind_of(Array)
    end 

    # it 'can save a list of books' do
        # collection =[]
       # expect(subject.save_to_file(collection)).to eq true
    # end

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

    # As a library
    # In order to make the books available to many individuals
    # I would like to set a return date on every check out
    # and I would like that date to be 1 month from checkout date

    it 'allows an individual to check out a book for one month' do
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