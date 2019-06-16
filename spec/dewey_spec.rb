require 'date'
require './lib/dewey.rb'


describe Dewey do
    subject { described_class.new }
    
    
    describe 'when book can be checked out' do
        book_num = 0
        let (:member) {instance_double('mem', name: "Max")}

        it 'adds member name to a checked out book' do 
            subject.add_member_name(book_num, member)
            expect(subject.books[book_num][:member]).to eq "Max"
        end
        
        it 'adds a return date to a checked out book' do
            subject.add_return_date(book_num)
            expect(subject.books[book_num][:return_date]).to eq Date.today.next_month.strftime('%Y-%m-%d')
        end

        it 'marks a checked out book as unavailable' do 
            subject.add_not_available(book_num)
            expect(subject.books[book_num][:available]).to eq false
        end
    end

    describe 'when book cannot be checked out' do
        let (:member) {instance_double('mem', name: 'Sasha')}
        
        it 'checks if book does not exist' do
            book_num=10
            expected_value = 'Selected book does not exist.'
            expect(subject.checkout_book(book_num, member)).to eq expected_value
        end
        
        it 'checks if book is already borrowed' do
            book_num=1
            expected_value = 'You already have this book.'
            expect(subject.checkout_book(book_num, member)).to eq expected_value
        end

        it 'checks if book is unavailable' do
            book_num=4
            expected_value = 'This book is checked out by someone else.'
            expect(subject.checkout_book(book_num, member)).to eq expected_value
        end
    end
end