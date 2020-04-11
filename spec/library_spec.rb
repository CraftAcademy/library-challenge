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
        expect(subject.find_title("Murder On The Orient Express")).to eq output  
    end

    it "Can search for category" do
        
    end

    it "Can search for available books" do
        
    end

    it "Can see return date for unavailable books" do
        
    end

    it "Can see who loaned books" do   # Other visitors should see it also?
        
    end
    





end