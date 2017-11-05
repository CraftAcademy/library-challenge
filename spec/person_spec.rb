require './lib/person.rb'

describe Person do
  it 'needs to respond to peoples name'
  expect(subject).to respond_to(:name)
end
