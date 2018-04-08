require './lib/person.rb'

describe Person do
  book1 = [ {:id=>1, :title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström", :return_date=>"2018-05-08"}]
  subject = Person.new('Michael', 9012241677)
  subject.books = book1
  it 'has name, personnummer and books' do
    expect(subject.name).to eq 'Michael'
    expect(subject.personnummer).to eq 9012241677
    expect(subject.books).to eq book1
  end

  it 'clears book from account when returning borrowed book' do
    subject.return(1)
    expect(subject.books).to eq []
  end
end
