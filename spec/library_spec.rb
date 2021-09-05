require_relative '../lib/library'
require 'date'

describe Library do
  after do
    # YAML source info https://medium.com/launch-school/storing-objects-in-yaml-with-ruby-d02c60e0dc65
    test_data = YAML.load_file('./lib/data_unchanged.yml')
    File.open('./lib/data.yml', 'w') { |file| file.write test_data.to_yaml }
  end

  it 'is expected to show a list of books' do
    expect(subject.collection).to_not eq nil
  end

  it 'is expected to search for a specific book by name in title' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:title] == book }
    # binding.pry
    expect(subject.search('Star Trek')).to eq expected_output
  end

  it 'is expected to search for any available book by title or author' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    expect(subject.available_books).to eq expected_output
  end

  # it 'is expected to checkout a book successfully' do
  #   expected_output = { message: 'Checkout of book success! Please return by:', date: Date.today.next_month }
  #   # binding.pry
  #   expect(subject.checkout_book('Star Trek')).to eq expected_output
  # end

  # it 'is expected to display a return date within 30 days of checkout' do
  #   # binding.pry
  #   expect(subject.checkout_book('The Prometheus Design')).to include(:date)
  # end
end
