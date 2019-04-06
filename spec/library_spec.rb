require './lib/library.rb'

describe Library do

    it 'should have a collection of books when initialized' do
    expect(subject.collection).to be_truthy
    end

    it 'should be possible to display what books are available' do
    expect(subject.available_books).to be_truthy
    end

    it 'should display correct amount of available books' do
    expect(subject.available_books.length).to eq 4
    end

end



