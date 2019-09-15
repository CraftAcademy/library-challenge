require './lib/user.rb'

describe User do
  it 'needs to print a list of available books, both title and author name' do
    expected_output = ["Alfons och soldatpappan : Gunilla Bergström", "Osynligt med Alfons : Gunilla Bergström", "Pippi Långstrump : Astrid Lindgren", "Pippi Långstrump går ombord : Astrid Lindgren"]
    expect(subject.find_available_books).to eq expected_output
  end

  it 'needs to see whether a specific book is available' do
    expected_output = ["Alfons och soldatpappan : Gunilla Bergström", "Osynligt med Alfons : Gunilla Bergström"]
    expect(subject.search_for_book_title('Alfons')).to eq expected_output
  end

  it 'is expected to have an account' do
    expect(subject.account).to eq []
  end

  it 'needs to be able to check out available books' do
    title = 'Alfons och soldatpappan'
    author = 'Gunilla Bergström'
    expect(subject.checkout(title, author)). to be_truthy
  end

  it 'needs to have a return date included in the users account' do
    title = 'Osynligt med Alfons'
    author = 'Gunilla Bergström'
    subject.checkout(title, author)
    date = String(Date.today + 30)
    expect(subject.account[0][:return_date]).to eq date
  end
end
