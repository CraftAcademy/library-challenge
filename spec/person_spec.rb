require './lib/person.rb'

describe Person do
  subject { described_class.new }

  let(:library_books) { YAML::load_file(File.join(__dir__, '../lib/data.yml')) }

  before do
    # store yaml file's original state
    @collection = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
  end

  after do
    # put yaml file in original state
    File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
  end

  it 'person should have bookshelf' do
      expect(subject).to respond_to(:bookshelf)
  end

  it 'person should have no overdue books on initialize' do
    expect(subject).to respond_to(:has_overdue_books)
  end

  it 'clears a persons bookshelf' do
    expect(subject.clear_bookshelf).to eq []
  end

  it 'should set state to true if has overdue books' do
    subject.bookshelf = [{:item=>{:title=>"Alfons och soldatpappan",
                                  :author=>"Gunilla Bergström"},
                                  :available=>false,
                                  :return_date=>'2013-07-04'}]
    expect(subject.check_overdue_books).to eq true
  end

  it 'should set state to false if has no overdue books' do
    subject.bookshelf = [{:item=>{:title=>"Alfons och soldatpappan",
                                  :author=>"Gunilla Bergström"},
                                  :available=>false,
                                  :return_date=>'2018-07-04'}]
    expect(subject.check_overdue_books).to eq false
  end

  it 'A person should be able to return a book' do
    subject.bookshelf = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
    book = 'Skratta lagom! Sa pappa Åberg'
    expect(subject.return_book(book)).to eq book
  end

end
