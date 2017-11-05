require './lib/person.rb'
# require './lib/library.rb'

describe Person do

  let(:library) { instance_double('Library', books: YAML.load_file('./lib/data.yml'))}
  subject { described_class.new(name: 'Scott')}

  it 'is expected to raise error if no name is filled in on initialize' do
    expect { described_class.new }.to raise_error 'Name is required'
  end

  it 'is expected to have a name if it takes an argument on initialize' do
    expect(subject.name).to eq 'Scott'
  end

  it 'is expected to set books to empty array on initialize' do
    expect(subject.my_books).to eq []
  end

  it 'is expected to set library to nil on initialize' do
    expect(subject.library).to be nil
  end

  describe 'can enter a library' do
    before { subject.enter_library }

    it 'of Library class' do
      expect(subject.library).to be_an_instance_of Library
    end

    it 'can view books of Library class' do
      expect(subject.library.books).to eq YAML.load_file('./lib/data.yml')
    end
  end

  #   it 'can search search for books in library' do
  #     expect(subject.search(title: 'Dia')).to be_truthy
  #   end
  # end
  #
  #   it 'can not search for books if not in library' do
  #     expect(subject.search(title: 'Dia')).to eq "Not in library!"
  #   end
end
