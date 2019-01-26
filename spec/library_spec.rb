require 'yaml'
require './lib/library.rb'
require 'date'

describe Library do
let(:book) { instance_double('Book', title: 'I am a title', author: 'AleciaLaura', available: true, return_date: '') }
    
    it 'sets up a return date when checked out' do
        expected_output = { available: false, message: 'success', date: Date.today }
        expect(subject.set_return_date()).to eq expected_output
    end

    #it can be false when the book is not available / true if available

    it 'gives a receipt when book is checked out' do
        expected_output = { status: false, message: 'success', date: Date.today }
        expect(subject.check_out()).to eq expected_output
    end

    it 'gives a receipt when book is checked in' do
        expected_output = { status: true, message: 'success', date: Date.today }
        expect(subject.check_in(45, '1234', account)).to eq expected_output
    end
end

   # 1)
   # item[:available] => true / false
   # check in -> change_status method true // checkout -> change_status false
   # receipt: when successfully checked in or out

   # 2)
   # date_today 
   # - when check out - set 30 days return date

   # 3) check_availability -> list of titles and authors (all books with availability or .filter and show only t4he available ones)
   # 4) when check in set return_date to '' (empty string)
   
   