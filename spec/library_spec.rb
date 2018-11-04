require './lib/library.rb'
require './lib/person.rb'
require 'date'

describe Library do

    # let(:customer) { instance_double('Person', user_id: '123456', pin_code: '1234',reading_list: [] )}
    customer = Person.new
    Date_of_book_return = (Date.today + 30).to_s

    # As a library
    # In order to have good books to offer to the public
    # I would like to be able to have a collection of books

    it 'has a list of books' do
        expect(subject.collection).not_to be_empty
        expect(subject.collection).to be_a_kind_of(Array)
        expect(subject.load_file()).to eq subject.collection
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
        expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        expect(subject.select_book(books_array,1)).to eq expected_output
    end 

    # As a library
    # In order to make the books available to many individuals
    # I would like to set a return date on every check out
    # and I would like that date to be 1 month from checkout date

    it 'allows an individual to check out a book for one month' do
        selected_book = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> Date_of_book_return}
        expect(subject.book_checkout(selected_book,'123456','1234', customer,subject.collection)).to eq expected_output
    end

    it 'when a person checks out a book, it is added to the reading list' do
        customer.reading_list = []
        selected_book = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> Date_of_book_return}]
        subject.book_checkout(selected_book,'123456','1234', customer,subject.collection)
        expect(customer.reading_list).to eq reading_list
    end

    it 'when a person checks out a book, it is updated in the yaml file' do
        
        customer.reading_list = []
        selected_book = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> Date_of_book_return}]
        checked_out_book = reading_list[0]
        subject.book_checkout(selected_book,'123456','1234', customer,subject.collection)
        expect(subject.save_to_file(subject.collection)).to eq true
        expect(subject.collection).to include checked_out_book
    end

   

end