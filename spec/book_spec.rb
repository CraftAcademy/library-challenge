require 'date'
require './lib/book.rb'

describe Book do
    subject {described_class.new({title: 'Alfons och soldatpappan', author: 'Gunilla Bergström', category: 'Children'})}

    it 'must have a title' do
        expect {described_class.new({author: "someone", category: 'Children'})}.to raise_error 'Book must have a title'
    end

    it 'must have an author' do
        expect {described_class.new({title: "something", category: 'Children'})}.to raise_error 'Book must have an author'
    end

    it 'must have a category' do
        expect {described_class.new({title: "something", author: 'Someone'})}.to raise_error 'Book must have a category'
    end

end