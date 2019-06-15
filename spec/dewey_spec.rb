## import files and built-in methods using <require('name')>
require 'date'
require './lib/dewey.rb'


describe Dewey do
    subject { described_class.new }
    let (:member) {instance_double('mem', name: "Max")}
    book_num = 0

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