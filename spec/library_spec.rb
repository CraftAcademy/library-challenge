require 'yaml'
require './lib/library.rb'
require 'date'

describe Library do

    it 'show all books in library' do
        books = YAML.load_file('./lib/data.yml')
        expect(subject.show_library).to eq books
    end

    it 'should have books available' do
      expect(subject.books).not_to be nil
    end


    it 'gives a return date of one month from checkout'
      expected_date = Date.today.next_month(1).strftime('%d/%m/%y')
      expect(subject.return_date).to eq expected_date
end
