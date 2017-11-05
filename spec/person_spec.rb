require './lib/person'

describe Person do

  subject { described_class.new(name: 'Lisa' )}
    #books:
  #  {:title=>"Alfons och soldatpappan", :return_date=>"05/12/17"}) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'it is possible to add a book' do
    subject.add_book(:title=>"Alfons och soldatpappan", :return_date=>"05/12/17")
    expect(subject.books).not_to be nil
  end

  it 'is expected that person can see their checked out books and due dates' do
    subject.add_book(:title=>"Alfons och soldatpappan", :return_date=>"05/12/17")
    expected_output = "Alfons och soldatpappan" + "05/12/17"
    test1 = subject.read_borrowed_books[0]
    expect(test1[:title]+test1[:return_date]).to eq expected_output
  end

  it 'is expected that person can return checked out books' do
    expect(subject.return_book("Alfons och soldatpappan")).to be nil
  end

end
