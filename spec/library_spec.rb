require 'yaml'
require './lib/library.rb'



describe Library do
    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'give name of book' do
        expected_output = 'Alfons och soldatpappan'
        expect(subject.book).to eq expected_output
    end
end