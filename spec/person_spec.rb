require './lib/person.rb'


describe Person do
  let(:person) {described_class.new(name:'Tarek')}

  it 'should person has name' do
    expect(person.name).to eq 'Tarek'
  end

  it 'Has an array of borrowed books' do
    expect(person.list_of_borrowed_book).to be_kind_of Array
  end

end
