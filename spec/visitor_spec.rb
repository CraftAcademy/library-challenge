require './lib/visitor'

RSpec.describe Visitor do
  subject { described_class.new({ name: 'Anna' }) }
  let(:library) { double('Library') }

  it 'is expected to have a name on initialize' do
    expect(subject.name).not_to be nil
  end
end
