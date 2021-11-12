require './lib/library.rb'
RSpec.describe Library do
  subject { described_class.new }

  it 'is expected to have books' do
    expect(subject.all_books).to be_truthy
  end

  it 'is expected to see available books' do
    expected_output = [
      {
        item: {
          title: "Harry Potter and Philosopher's Stone",
          author: 'J. K. Rowling',
        },
        available: true,
        return_date: nil,
      },
      {
        item: {
          title: 'Silk',
          author: 'Aleksandro Bariko',
        },
        available: true,
        return_date: nil,
      },
    ]
    expect(subject.available_books).to eq expected_output
  end
end
