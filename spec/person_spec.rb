require './lib/person.rb'
require 'pry'

describe Person do

    subject {described_class.new(name:'Thomas')}

    it'expect to have name on initilize' do
        expect(subject.name).to eq 'Thomas'
    end

    it 'expect to raise error when no name is inserted' do
        expect {described_class.new}.to raise_error('Missing name')
    end
end