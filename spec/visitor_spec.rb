require './lib/librarian.rb'
require 'date'


describe Visitor do
    let(:librarian) { Librarian.new }

    it 'has an attribute of rented books on initialize, that is an empty array' do
        expect(subject.rented_books).to eq []
    end

    it 'upon checkout, visitor will receive the book to his list' do
        title = "Big Fish"
        librarian.check_out(title, subject)
        book = librarian.list.detect { |hash| hash[:book][:title] == title }
        expect(subject.rented_books).to eq [book]

    end

end