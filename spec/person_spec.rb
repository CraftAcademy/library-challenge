require './lib/person.rb'
require './lib/library.rb'

describe Person do
  let(:library) { Library.new }
  subject { described_class.new('Alfred')}
  it 'has a name on initialize' do
    expect(subject.name).to eq 'Alfred'
  end
end
