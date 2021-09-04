require './lib/library'
require 'yaml'

describe Library do
  subject { described_class.new }
  it 'is expected to be able to search for books by title' do
    expect(subject.search_for_title('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                                  title: 'The Expanse' }, available: true,
                                                          return_date: nil
  end

  it 'is expected tobe able to search for books by author' do
    expect(subject.search_for_author('James S. A. Corey')).to eq book: { author: 'James S. A. Corey',
                                                                         title: 'The Expanse' }, available: true,
                                                                 return_date: nil
  end

  it 'it expected that a customer can check out a book' do
    expect(subject.checkout_book('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                                title: 'The Expanse' }, available: false,
                                                      return_date: nil
  end
end

