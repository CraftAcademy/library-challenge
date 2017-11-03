require './lib/library'

describe Library do
  it 'has book list' do
    expected_output = subject.book_selection
    expect(subject.book_list).to eq expected_output
  end

end
