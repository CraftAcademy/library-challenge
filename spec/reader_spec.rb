require './lib/reader.rb'
require './lib/librarycard.rb'
require 'pry'

describe Reader do

    subject {described_class.new(name: "Fat Bob")}

    it 'is expected to have a :name upon initialize' do
        expect(subject.name).not_to be nil
    end

    it 'is expected to raise an error if no name is set' do
        expect {described_class.new}.to raise_error 'A name is required'
    end

    it 'is expected to have a :books attribute with value of 0 on initialize' do
        expect(subject.books).to eq 0
      end

    it 'is expected to have an :library_card attribute' do
        expect(subject.library_card).to be nil
    end

    describe 'can get a library card' do
        before {subject.create_library_card}
         it 'of Card class' do
            expect(subject.library_card).to be_an_instance_of Card
        end

        it 'with himself as an owner' do
            expect(subject.library_card.owner).to be subject
        end
    end    

    describe 'can checkout and return books if a library card has been created' do
        let(:librarian) { Librarian.new }
        before { subject.create_library_card }
        it 'can checkout books' do
            expected_output = "Women who Run with the Wolves by Clarissa Pinkola Estes is available.
            Would you like to check it out?(Y/N)"
            expect(subject.reader_checkout(title: 'Women who Run with the Wolves', librarian: librarian)).to be eq expected_output
        end

        it 'can return books' do
            expected_output = "Would you like to return 'Women who Run with the Wolves' by 'Clarissa Pinkola Estes'?"
            expect(subject.reader_return(title: 'Women who Run with the Wolves', librarian: librarian)).to be eq expected_output
        end

    end
end