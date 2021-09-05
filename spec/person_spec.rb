require './lib/person'

describe Person do
  subject { described_class.new(name: 'Thomas') }
  let(:library) { Library.new }

  after(:each) do
    puts 'Resetting data.yml using test_data.yml'
    collection = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
  end

  it 'is expected to have a name initilazed' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to be able to checkout books' do
    title = 'Osynligt med Alfons'
    subject.checkout(title, library)
    expect(subject.bookshelf.detect { |book| book[:book][:title] == title }).not_to be nil
  end
end
