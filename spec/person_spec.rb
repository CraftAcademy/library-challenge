require './lib/person'

describe Person do

  subject { described_class.new(name: 'Mariza') }

  it 'needs to indentify individuals by name' do
    expect(subject.name).not_to be nil
  end

  xit 'needs to show the individual a list of books' do
    expect(subject)
  end
end
