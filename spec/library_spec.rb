require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do 



    it 'is expected to have books on initialize' do
        expect(subject.items).to eq YAML.load_file('./lib/data.yml')
    end

    it 'rejects check out of a book if that book is unavailble' do
        expected_output = { status: false, message: 'Book is unavailable' }
        expect(subject.check_out).to eq expected_output
    end

    #it 'rejects check out if the person has books that has not been returned in time' do
    #end

    #it 'performs check out if book is available' do
    #expect(subject.items).to eq check_out_yes
    #end

    #it 'has todays date' do
    #today_date = Date.strftime.now('%d/%m')
    #end


    #it 'is expected that the :available status chenages when a book is checked out' do
    #expect(subject.item).to change(:available).from(true).to false
    #end
end