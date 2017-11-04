require './lib/person'

describe 'Person' do
  it 'needs to indentify individuals by name' do
    expect(subject).to repsond_to(:name)
  end

  xit 'needs to show the individual a list of books' do
    expect(subject)
  end
end
