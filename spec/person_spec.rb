require './lib/person.rb'

describe Person do
  subject { described_class.new(name:'Jim') }

  it 'has a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'has please enter name' do
    expect{ described_class.new }.to raise_error 'please enter name'
  end
end
