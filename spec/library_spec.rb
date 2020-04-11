require 'date'
require './lib/library.rb'

describe Library do

    subject { described_class.new() }

    it "Create a list of all books" do
        expect(subject.list_all().length).to eq 32
    end

    it "Can search for a specific book" do
        
    end

    it "Can search for category" do
        
    end

    it "Can search for author" do
        
    end

    it "Can search for available books" do
        
    end

    it "Can see return date for unavailable books" do
        
    end

    it "Can see who loaned books" do   # Other visitors should see it also?
        
    end
    





end