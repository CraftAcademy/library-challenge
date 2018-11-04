require './lib/person.rb'
require 'yaml'

describe Person do
    let(:library) { instance_double('Library', collection: YAML.load_file('./lib/data.yml')) }
    
    it 'Allows to show all available books' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:available] == true }
        expect(subject.person_books_available(library)).to eq expected_output
    end
end