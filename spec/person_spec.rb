require './lib/person.rb'
require 'pry'

describe Person do

    after(:each) do
        original = YAML.load_file('./lib/data_original.yml')
        File.open('./lib/data.yml', 'w') { |f| f.write original.to_yaml }
    end

    subject {described_class.new("Boa")}
    let(:library) { instance_double('Library')}
    
    it 'should have a name when initialized' do
        expect(subject.name).to eq "Boa"
    end

    it 'should be able to view all books that are available' do
        expect(subject.show_available_books.length).to eq 4
    end
    
    it 'should be able to search for a book based on its title' do
        expected_output = [{:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>true, :return_date=>nil, :borrowed_by=>nil}]
        expect(subject.search_book_by_title("Alfons och soldatpappan")).to eq expected_output
    end

    it 'should be able to search for books based on author' do
        expected_output = [{:item=>3, :title=>"Pippi Långstrump", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}, {:item=>4, :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren", :available=>true, :return_date=>nil, :borrowed_by=>nil}]
        expect(subject.search_book_by_author("Astrid")).to eq expected_output
    end

    it 'should be able to make it possible to checkout a book, and update the item availability, return date and borrowed by' do
        subject.checkout_book(0)
        collection = YAML.load_file('./lib/data.yml')
        expected_output = {:item=>0, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :available=>false, :return_date=>"2019-05-07", :borrowed_by=>"Boa"}
        expect(collection[0]).to eq expected_output
    end

    it 'should get a success message when book is checked out' do
        expect(subject.checkout_book(0)).to eq "You have borrowed Alfons och soldatpappan. Please return it by 2019-05-07"
    end

    it 'should get an "error" message when book is not available' do
        expect(subject.checkout_book(1)).to eq "Book is not available until 2019-05-25. Please come back then"
    end

end