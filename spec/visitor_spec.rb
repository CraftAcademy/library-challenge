require './lib/visitor'
require './lib/library'

describe Visitor do
  subject { described_class.new(name: 'Serge') }

  it 'is expected to have a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to be able to search for all available books' do
    list_of_books = YAML.load_file('./lib/base_data.yml')
    expected_output = list_of_books.select { |obj| obj[:available] == true }
    expect(subject.list_available_books).to eq expected_output
  end

  it 'is expected that a customer can checkout a book' do
    expected_output = "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
    expect(subject.checkout_book('The Way Of Kings', 'Serge')).to eq expected_output
  end

  it 'is expected that if a book is already checked out it should tell the user it is unavailable' do
    expected_output = 'Book unavailable.'
    expect(subject.checkout_book('Code', "Serge")).to eq expected_output
  end

  it 'is expected that a book that is being checked out has a return date' do
    expected_output = "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
    expect(subject.checkout_book('The Expanse', "Serge")).to eq expected_output
  end

  it 'is expected that when a book is checked out a name will be stored' do
    expected_output = "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
    expect(subject.checkout_book('The Expanse', "Serge")).to eq expected_output
  end
end
