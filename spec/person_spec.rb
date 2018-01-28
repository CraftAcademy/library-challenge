require './lib/person.rb'

describe Person do
  subject { described_class.new }

  let(:library_books) { YAML::load_file(File.join(__dir__, '../lib/data.yml')) }

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
    expect(subject.check_overdue_books).to eq true
  end

end
