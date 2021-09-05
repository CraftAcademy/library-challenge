require './lib/visitor'
require './lib/library'

describe Visitor do
  after do
    updated_list = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/test_data.yml', 'w') { |f| f.write updated_list.to_yaml }
    # updated_list.detect { |obj| obj[:book][:title].include? title }
  end

  subject { described_class.new(name: 'Serge') }

  it 'is expected to have a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to be able to search for books by title' do
    expect(subject.search_for_title('The Expanse')).to eq [{ book: { author: 'James S. A. Corey',
                                                                     title: 'The Expanse' }, available: true,
                                                             return_date: nil, checked_out_by: nil }]
  end

  it 'is expected to be able to search for books by author' do
    expect(subject.search_for_author('James S. A. Corey')).to eq [{ book: { author: 'James S. A. Corey',
                                                                            title: 'The Expanse' }, available: true,
                                                                    return_date: nil, checked_out_by: nil }]
  end

  it 'is expected that a customer can checkout a book' do
    expect(subject.checkout_book('The Way Of Kings',
                                 'Serge')).to eq "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
  end

  it 'is expected that if a book is already checked out it should tell the user it is unavailable' do
    expect(subject.checkout_book('Code', 'Serge')).to eq 'Book unavailable.'
  end

  it 'is expected that a book that is being checked out has a return date' do
    expect(subject.checkout_book('The Expanse',
                                 'Serge')).to eq "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
  end

  it 'is expected that when a book is checked out a name will be stored' do
    expect(subject.checkout_book('The Expanse',
                                 'Serge')).to eq "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"
  end

  it 'is expected that a customer can return a book' do
    expect(subject.return_book('Oliver Twist')).to eq 'Book returned.'
  end

  it 'is expected to be able to search for all available books' do
    list_of_books = YAML.load_file('./lib/base_data.yml')
    expect(subject.list_available_books).to eq list_of_books.select { |obj| obj[:available] == true }
  end
end
