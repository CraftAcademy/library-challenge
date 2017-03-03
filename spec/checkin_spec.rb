require 'yaml'
require './lib/library.rb'

collection = YAML.load_file('./lib/data.yml')
person = YAML.load_file('./lib/person.yml')
describe Library do

    subject { described_class.new }

    it 'allow individuals to return books' do
      subject.return_book(1)
      expect(person[0][:available]).to eq true
    end
  
end
