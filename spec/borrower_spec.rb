require './lib/library_account.rb'
require 'date'
require 'books.yml'
require '/lib/borrower.rb'

describe Borrower do

    subject {described_class.new(name: 'Christina')}

    He or she 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end

    It 'is expected that an error will be raised if no name is set' do
        expect {described_class.new}.to raise_error 'A name is required'
    end