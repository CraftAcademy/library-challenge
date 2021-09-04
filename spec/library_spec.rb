require './lib/library'
require 'yaml'

describe Library do
  after do
    updated_list = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/_base_data.yml', 'w') { |f| f.write updated_list.to_yaml }
    # updated_list.detect { |obj| obj[:book][:title].include? title }
  end

  subject { described_class.new }
  it 'is expected to be able to search for books by title' do
    expect(subject.search_for_title('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                                  title: 'The Expanse' }, available: true,
                                                          return_date: nil
  end

  it 'is expected to be able to search for books by author' do
    expect(subject.search_for_author('James S. A. Corey')).to eq book: { author: 'James S. A. Corey',
                                                                         title: 'The Expanse' }, available: true,
                                                                 return_date: nil
  end

  it 'is expected that a customer can check out a book' do
    expect(subject.checkout_book('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                               title: 'The Expanse' }, available: false,
                                                       return_date: nil
  end

  it 'is expected that if a book is already checked out it should tell the user it is unavailable' do
    expect(subject.checkout_book('Code')).to eq "book unavailable"
  end
end
