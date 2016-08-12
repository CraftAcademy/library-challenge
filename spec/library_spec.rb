require './lib/library.rb'

describe Library do
  let(:person) {double('Person')}

  it 'is expected to have a list' do
    expect(subject.items).not_to be nil
  end



end
