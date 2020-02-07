
require './lib/library.rb'
# As a programmer            
# So that the game can be played according to the rules            
# I want a normal number to return that number

describe Library do
    subject { described_class.new }
    #it 'Finds the library empty' do
        #expect(subject.collection).to eq nil
    #end

    it 'Checks if the library collection is not empty' do
        expect(subject.collection).to_not eq nil
    end

    it 'Checks if the library has the book "Alfons och soldatpappan"' do
        expect(subject.collection[0][:item][:title]).to include("Alfons och soldatpappan")
    end

    ##  As a citizen I would like to use our public libraries
    ##  To have something to read
    ##  I should be able to lend a book to read it



    it 'Checks if the book is you can change availible status' do
        subject.change_availability(0)
        expect(subject.collection[0][:available]).to eq false
    end

    

end

