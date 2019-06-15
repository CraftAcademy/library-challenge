require './lib/visitor.rb'

describe Visitor do

    it 'can borrow books if visitor has a name' do
        expect(subject.set_name).to eq name
    end
end