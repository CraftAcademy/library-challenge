require './lib/library.rb'

describe Library do
subject { described_class.new()}
  it 'should load available books from a file' do
  expect(subject.available_books.length).to eq 5
  end
end
