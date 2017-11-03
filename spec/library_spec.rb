require './lib/library'

describe Library do
  it 'has book list' do
    expected_output = '{[:item][:title], [:item][:author]}'
    expect(subject.book_list).to eq expected_output
  end

end
