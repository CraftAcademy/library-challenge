require './lib/library.rb'

describe Library do
  let(:person) {double('Person')}

  it 'has a list of items' do
    expect(subject.items).not_to be nil
  end

  it 'sets return_date' do
    subject.set_return_date(0)
    expect(subject.items[0][:return_date]).to eq(subject.set_return_date(0))
  end

end
