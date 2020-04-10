require 'date'
require './lib/book.rb'

describe Book do
    subject {described_class.new({title: 'Alfons och soldatpappan', author: 'Gunilla Bergström', category: 'Children'})}

    let(:person) {instance_double("Person")}

    it 'must have a title' do
        expect {described_class.new({author: "someone", category: 'Children'})}.to raise_error 'Book must have a title'
    end

    it 'must have an author' do
        expect {described_class.new({title: "something", category: 'Children'})}.to raise_error 'Book must have an author'
    end

    it 'must have a category' do
        expect {described_class.new({title: "something", author: 'Someone'})}.to raise_error 'Book must have a category'
    end

    it 'Book must not be available after checkout' do
        subject.checkout(person)
        expect(subject.available).to eq false
    end

    it 'Book can not be check out if not available' do
        subject.checkout(person)
        expect{subject.checkout(person)}.to raise_error 'Book not available'
    end

    it 'Book must be available after return' do
        
       
    end

    it 'Gives out receipt after checkout' do

    end

end