## import files and built-in methods using <require('name')>
require 'date'
require './lib/dewey.rb'


describe Dewey do
    subject { described_class.new }
    let (:member) {instance_double('mem', name: "Max")}

    it 'adds member name to a checked out book' do 
        subject.add_member_name(1, member)
        expect(subject.books[0][:member]).to eq "Max"
    end
    
    it 'adds a return date to a checked out book' do
        subject.add_return_date(1)
        expect(subject.books[0][:return_date]).to eq Date.today.next_month.strftime('%Y-%m-%d')
    end

    it 'marks a checked out book as unavailable' do 
        subject.not_available(1)
        expect(subject.books[0][:available]).to eq false
    end

end