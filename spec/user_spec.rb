require './lib/library.rb'
require './lib/user.rb'
require 'date'
require 'yaml'

describe User do
    
    subject { described_class.new(name: 'Jenny', account: :active) }
    
    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end
    
    # it ' is expected to raise an error if no name is set' do
    #     expect { described_class.new }.to raise_error 'A name is required'
    # end

    
end