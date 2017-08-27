require './lib/person.rb'

describe Person do
  before do
  end

  after do
    collection = YAML.load_file('./lib/books.yml')
    collection.each { |obj| obj[:available] = true }
    File.open('./lib/books.yml', 'w') { |f| f.write collection.to_yaml }
  end

  it 'can check th return date on books they have rented' do
    expected_output = (subject.search_my_books)
    expect(subject.search_my_books).to eq expected_output
  end
end
