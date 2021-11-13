require './lib/library.rb'
RSpec.describe Library do
  subject { described_class.new }

  it 'is expected to have books' do
    expect(subject.all_books).to be_truthy
  end

  it 'is expected to see title and author of available books' do
    expected_output = [
      {
        title: "Harry Potter and Philosopher's Stone",
        author: 'J. K. Rowling',
      },
      { title: 'Silk', author: 'Aleksandro Bariko' },
    ]
    expect(subject.find_available_books).to eq expected_output
  end
end
