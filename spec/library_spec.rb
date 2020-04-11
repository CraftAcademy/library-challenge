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
        output = subject.find_author("Agatha Christie")
        expect(output.length).to eq 1
        expect(subject.find_title("Murder On The Orient Express")).to eq output  
    end

    it "Can search for category" do
        expect(subject.find_category("Sci-fi").length).to eq 8
        
    end

    it "Can search for available books" do
        expect(subject.find_available.length).to eq 32
        subject.collection[0].checkout(Person.new({name: "Sara"}))
        expect(subject.find_available.length).to eq 31
    end

    it "Can see return date for unavailable books" do
        subject.collection[0].checkout(Person.new({name: "Sara"}))
        expect(subject.find_unavailable[0].return_date ).not_to be nil
    end

    it "Can see who loaned books" do   # Other visitors should see it also?
        subject.collection[0].checkout(Person.new({name: "Sara"}))
        expect(subject.find_unavailable[0].loanee).not_to be nil 
    end

end