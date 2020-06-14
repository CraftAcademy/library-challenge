require './lib/data.yml'
require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:person) {instance_double('Person', name: 'Viktor')}
    subject { described_class.new({owner: person}) }
end