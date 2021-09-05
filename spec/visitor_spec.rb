require './lib/visitor'
require './lib/library'

describe Visitor do
  subject {described_class.new(name: 'Serge')}


  it 'is expected to have a name on initialize' do
    expect(subject.name).not_to be nil
  end

end