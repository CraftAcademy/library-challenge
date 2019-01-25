require 'date'
require './lib/visitor.rb'

describe Visitor do

    subject { described_class.new(name: 'Viktor') }

        it'is expected to have a name on initialize' do
            expect(subject.name).not_to be nil
        end 

end
