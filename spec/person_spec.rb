require './lib/person.rb'

describe Person do
  it 'should have a name' do
    expect(subject).to respond_to(:name)
  end
end
