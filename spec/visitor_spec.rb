require 'yaml'
require './lib/visitor.rb'
require './lib/library.rb'
require 'date'

describe Visitor do
    let(:person) {instance_double('Person', name: 'Viktor')}

    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'shows me a list of books in my possession' do
        expect(subject.my_list).to_not include(nil)
    end
end