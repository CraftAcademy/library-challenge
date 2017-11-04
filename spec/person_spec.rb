require './lib/person'

describe Person do

  subject {described_class.new(name: 'India')}

  it 'has name on initialize' do
    expect(subject.name).not_to be nil
  end
end
