require './lib/visitor.rb'
require './lib/library.rb'

describe Visitor do

    subject { described_class.new(name: 'Noel') }

    it 'Should create a Visitor' do
    expect(subject.new).not_to eq nil
    end




end


