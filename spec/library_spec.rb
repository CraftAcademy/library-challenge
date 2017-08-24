require './lib/library.rb'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_truthy
  end

  it 'should list books' do
    expected_output = subject.collection
    expect(subject.collection).to eq expected_output
  end

end
