require './lib/person.rb'

describe Person do
  book2 = [{:id=>2, :title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström", :return_date=>"2016-05-25"}]
  subject = Person.new('Bert Andersson', 9012241677)
  subject.books = book2

  it 'has name, personnummer and books' do
    expect(subject.name).to eq 'Bert Andersson'
    expect(subject.personnummer).to eq 9012241677
    expect(subject.books).to eq book2
  end
  
end
