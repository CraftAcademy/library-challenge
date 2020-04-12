require 'date'
require './lib/library.rb'
require './lib/book.rb'
require './lib/person.rb'

describe Library do

    subject { described_class.new() }

    it "Create a list of all books" do
        expect(subject.list_collection.length).to eq 32
    end

    it "Can search for a title or author" do
        # As a visitor
        # In order to find a specific book
        # I need to search the library book collection
        output = subject.find_author("Agatha Christie")
        expect(output.length).to eq 1
        expect(subject.find_title("Murder On The Orient Express")).to eq output  
    end

    it "Can search for category" do
        # As a visitor
        # In order to find a specific book
        # I need to search the library book collection
        expect(subject.find_category("Sci-fi").length).to eq 8
        
    end

    it "Can search for available books" do
        expect(subject.find_available.length).to eq 32
        subject.collection[0].checkout(Person.new({name: "Sara"}))
        expect(subject.find_available.length).to eq 31
        subject.collection[0].return_book
    end

    it "Can see return date for unavailable books" do
        sara = Person.new({name: "Sara"})
        subject.collection[0].checkout(sara)
        expect(subject.find_unavailable(sara)[0][:return_date] ).not_to be nil
        subject.collection[0].return_book
    end

    it "Can see who loaned books" do   # Other visitors should see it also?
        # As a librarian
        # In order to have loaned books back
        # I need to know who loaned book
        # As a user
        # In order to keep my personal information safe
        # I don't want other users to know what I am reading
        sara = Person.new({name: "Sara"})   
        subject.collection[0].checkout(sara)
        expect(subject.find_unavailable(sara)[0][:loanee]).to be nil
        boris = Person.new({name: "Boris", role: "Librarian"})
        expect(subject.find_unavailable(boris)[0][:loanee]).not_to be nil
        subject.collection[0].return_book
    end

    it 'can registers users' do
        users = subject.users.length
        subject.add_user({name: "Alice"})
        expect(subject.users.length).to eq (users + 1)
    end

end