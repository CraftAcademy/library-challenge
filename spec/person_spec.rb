require './lib/person.rb'

describe Person do

<<<<<<< HEAD
  before(:each) do
    @person = Person.new
  end
=======
  let(:person) {instance_double('Person', name: 'David')}
  subject { described_class.new }
>>>>>>> master

  it 'person should have bookshelf' do
      expect(@person).to respond_to(:bookshelf)
  end

  it 'can checkout a book' do
    book = 'Osynligt med Alfons'
    expect(@person.checkout(book)).to eq book
  end

=begin

  it 'sets a books status to false if checked out' do
    #expected_output = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
    expect(subject.bookshelf).to include(:available => false)
  end

=end

end
