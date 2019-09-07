 #YAML for database with list of available 
    #books (title, author availability)
require './lib/library.rb'
require './lib/book.rb'
require 'yaml'
require 'date'

describe Library do

    it 'is expected to search for author' do
        subject.search_author("Gunilla")
        expect(subject.collection).to eq true
    end

    it 'is expected to search for title' do
        subject.search_title("Alfons")
        expect(subject.collection).to include{:title}
    end

    it 'is expected to store all books in an easily accessable file' do
        expect(subject.collection).to include{:item}
    end

    it 'is expected to checkout a book' do
        expect(subject.collection)[0][:available] == false
    end
end