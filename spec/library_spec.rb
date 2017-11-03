require './lib/library'

describe Library do
  it 'has book list on initalize' do
    expect(subject.book_list).not_to be nil
  end

end
