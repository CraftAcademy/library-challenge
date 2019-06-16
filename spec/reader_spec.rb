require './lib/reader.rb'
require './lib/librarycard.rb'
require './lib/librarian.rb'
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
        before {subject.get_library_card}
         it 'of Card class' do
            expect(subject.library_card).to be_an_instance_of Card
        end

        it 'with himself as an owner' do
            expect(subject.library_card.owner).to be subject
        end
    end    

    # describe 'can checkout and return books if a library card has been created' do
    #     let(:librarian) { Librarian.new }
    #     before { subject.get_library_card }

    #     it 'can checkout books' do
    #         subject.stub(:gets).and_return("Y")
    #         expected_outcome = "Check out confirmed, library has been updated!"
    #         expect(subject.reader_checkout_title(title: 'Women who Run with the Wolves', librarian: librarian)).to eq expected_outcome
    #     end

    #     # it 'can return books' do
    #     #     expect(subject.reader_return_title(title: 'Women who Run with the Wolves', librarian: librarian)).not_to be nil
    #     # end

    # end
end