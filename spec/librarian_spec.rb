require './lib/librarian.rb'
require 'pry'


describe Librarian do

    it 'has to have 10 books' do
        expect(subject.books).to eq 10
    end

    it 'has a search function' do
        book_info = {:item=>{:title=>"Dexter", :author=>"Jeff Lindsay"}, :available=>false, :return_date=>"2019-11-03"}
        expect(subject.search_books('Dexter')).to eq book_info
    end

    it 'has to be able to check out books' do
        receipt = {title: 'title', author: 'author', date: Date.today}
        expect(subject.checkout_books('title', 'author')).to eq receipt
    end

    it 'updates books inside library file when they are checked out/checked in' do
        confirmation = {title: 'title', author: 'author', date: Date.today, updated?: true}
        expect(subject.update_books('title', 'author')).to eq confirmation
    end

    it 'verifies that a reader has an account before checking out books' do
        verified = {name: "Ronald McDonald", card_number: 12345}
        expect(subject.verify_reader_account('Ronald McDonald', 12345)).to eq verified
    end

    it 'loads a library upon initialization' do
        expect(subject.library).not_to be nil
    end

end