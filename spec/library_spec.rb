require 'yaml'
require './lib/library.rb'
require 'date'



describe Library do
    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'give name of book' do
        expected_output = 'Alfons och soldatpappan'
        expect(subject.book).to eq expected_output
    end

    it 'return date is set one month forward' do
        expected_date = Date.today.next_month.strftime('%d/%m/%y')
        expect(subject.return_date).to eq expected_date
    end

    it 'check for the availability of the books' do
        expect(subject.availability).to_not include(false)
    end

end