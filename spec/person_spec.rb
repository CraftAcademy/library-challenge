require './lib/person.rb'
require 'pry'

describe Person do
    subject {described_class.new("Boa")}
    
    it 'should have a name when initialized' do
        expect(subject.name).to eq "Boa"
    end

    it 'should be able to view all collection that are available' do
        expect(subject.show_available_books.length).to eq 4
    end
    
    it 'should be able to search for a book based on its title'do
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"},:available=>true, :return_date=>nil, :borrowed_by=>nil}]
        expect(subject.select_book_by_title("Alfons och soldatpappan")).to eq expected_output
    end

    it 'should be able to make it possible to checkout a book, and update the item availability' do
        subject.checkout_book(0)
        expect(subject.collection[0][:available]).to eq false
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should update the return date when book is checked out' do
        subject.checkout_book(0)
        new_date = subject.collection[0][:return_date]
        expect(subject.collection[0][:return_date]).to eq new_date
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should update the return date when book is checked out' do
        subject.checkout_book(0)
        new_date = subject.collection[0][:return_date]
        expect(subject.collection[0][:return_date]).to eq new_date
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should get a success message when book is checked out' do
        new_date = subject.collection[0][:return_date]
        expect(subject.checkout_book(0)).to eq "You have borrowed Alfons och soldatpappan. Please return it by #{new_date}"
        subject.collection[0][:available] = true
        subject.collection[0][:return_date] = nil
        subject.collection[0][:borrowed_by] = nil
        subject.save_updates
    end

    it 'should get an "error" message when book is not available' do
        expect(subject.checkout_book(1)).to eq "Book is not available until 2019-05-25. Please come back then"
    end

end