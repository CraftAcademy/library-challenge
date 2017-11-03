require './lib/library'

describe Library do
  it 'has book list' do
    expected_output = subject.book_selection
    expect(subject.book_list).to eq expected_output
  end
  it 'shows book list' do
    expected_output = '#{book[:item][:title]}'
    expect(subject.show_books).to eq expected_output
  end
end
