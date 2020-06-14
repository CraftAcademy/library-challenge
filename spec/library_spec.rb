require 'yaml'
require './lib/library.rb'
require 'date'



describe Library do
    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'gives a list of books by title and author' do
        expect(subject.books).to include 'Alfons och soldatpappan'
    end

    it 'return date is set one month forward' do
        expected_date = Date.today.next_month.strftime('%d/%m/%y')
        expect(subject.exp_return_date).to eq expected_date
    end

    it 'check for the availability of the books' do
        expect(subject.availability).to_not include(false)
    end

    it 'check for the return date of the non available books' do
        expect(subject.not_available).to_not eq nil
    end

end