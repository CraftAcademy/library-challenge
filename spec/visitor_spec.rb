require './lib/visitor.rb'
require './lib/library.rb'

describe Visitor do
 
    #let(:visitor) {instance_double('Visitor', name: 'Thomas', password: '1234')}
   # subject { described_class.new({owner: person}) }

    it 'Should create a Visitor' do
    expect(Visitor.new("Noel", "Ryan")).not_to eq nil
    end

end


