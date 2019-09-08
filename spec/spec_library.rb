 #YAML for database with list of available 
    #books (title, author availability)
require './lib/library.rb'
require './lib/book.rb'
require 'yaml'
require 'date'

describe Library do
    
    it 'is expected to search for author' do
        #expected_output = collection.select{|book| book[:book][:title].include? :author }
        #expect(subject.search_author).to eq expected_output
        subject.search_author("Gunilla")
        expect(subject.search_author).to include{:author}
    end

    #it 'is expected to search for title' do
        #expected_output = {book |book|[:book][:author]}
        #expect(subject.search_author).to eq expected_output
        #subject.search_title("Alfons")
        #expect(subject.collection).to include{:title}
        #collection.select { |obj| obj[:book][:title].inlcude? "Alfons"}
    #end

    it 'is expected to store all books in an easily accessable file' do
        expect(subject.collection).not_to be nil
    end

    it 'is expected to checkout a book' do
        expect(subject.collection[0][:available]) == false
        #collection.select { |obj| obj[:book][:available].to eq true}
        #expect(subject.collection).to include{:available}
    end
end