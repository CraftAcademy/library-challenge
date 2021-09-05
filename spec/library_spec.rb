require './lib/library'
require 'date'

describe Library do
  let(:person) { instance_double('Person', name: 'Thomas', bookshelf: [{book: {title: 'Guinnues world records'}, return_date: Date.today.next_year}])}
  after(:each) do
    puts "Resetting data.yml using test_data.yml"
    collection = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
  end
  
  it 'is expected to contain books' do
    expect(subject.available_books).to be_truthy
  end

  it 'is expected to check out available books' do
    title = 'Alfons och soldatpappan'
    expected_output = { status: true, message: "You've checked out #{title}", date: Date.today,
                        return_date: Date.today.next_month }
    expect(subject.checkout(title, person)).to eq expected_output
  end

  it 'is expected to not check out unavailable books' do
    title = 'Skratta lagom! Sa pappa Åberg'
    return_date = subject.collection.detect { |book| book[:book][:title] == title }[:return_date]
    subject.collection.detect { |book| book[:book][:title] == title }[:available] = false
    expected_output = { status: false,
                        message: "#{title} is not available, please come back after #{return_date}.", date: Date.today }
    expect(subject.checkout(title, person)).to eq expected_output
  end

  it 'is expected that after a book is checked out, it is no longer available' do
    title = 'Pippi Långstrump'
    subject.checkout(title, person)
    checkedout_book = subject.collection.detect { |book| book[:book][:title] == title }
    expect(checkedout_book[:available]).to eq false
  end

  it 'is expected to not checkout books to persons with overdue books' do
    title = 'Pippi Långstrump'    
    person.bookshelf.pop
    person.bookshelf.append({book: {title: 'Alfons och soldatpappan'}, return_date: Date.today.next_month(-1)})
    
    expected_output = { status: false,
                        message: "Unavailable to checkout when having overdue books.", date: Date.today }
    expect(subject.checkout(title, person)).to eq expected_output 
    
  end

end
