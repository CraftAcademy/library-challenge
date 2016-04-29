require './lib/library'

describe Library do

  it 'is expected to have a :catalog' do
    expect(subject.catalog).not_to be nil
  end

  it ':catalog is expected to have items' do
    expected_content = {item:
                            {title: 'Skratta lagom! Sa pappa Åberg',
                             author: 'Gunilla Bergström'},
                        available: true,
                        return_date: nil}
    expect(subject.catalog).to include expected_content
  end

  it ':catalog has 5 items' do
    expect(subject.catalog.count).to eq 5
  end

  it 'allows book for checkout' do
    book = {item:
                            {title: 'Skratta lagom! Sa pappa Åberg',
                             author: 'Gunilla Bergström'},
                        available: true,
                        return_date: nil}
    subject.checkout(book)
    expect(book[:available]).to eq false
  end
end
