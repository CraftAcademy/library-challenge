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

    it 'is expected to have an :library_card attribute' do
        expect(subject.library_card).to be nil
    end

    describe 'can get a library card' do
        before {subject.create_library_card}
         it 'of Card class' do
            expect(subject.library_card).to be_an_instance_of Card
        end
    end    
end