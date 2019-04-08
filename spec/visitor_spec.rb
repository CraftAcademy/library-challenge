require './lib/visitor.rb'
require './lib/library.rb'

describe Visitor do
 
    subject { described_class.new(username: 'Noel', password: 'Ryan') }
    
    it 'Should create a Visitor' do
    expect(subject.new(visitor)).not_to eq nil
    end

end


