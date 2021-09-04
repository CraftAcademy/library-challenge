require_relative '../lib/library'
require 'date'
require 'pry'

describe Library do
  after do
    # YAML source info https://medium.com/launch-school/storing-objects-in-yaml-with-ruby-d02c60e0dc65
    test_data = YAML.load_file('./lib/data_test.yml')
    File.open('./lib/data.yml', 'w') { |file| file.write test_data.to_yaml }
  end

  # let(:objects) { instance_double() }

  # subject { described_class.new }

  it 'is expected to show a list of books' do
    expect(subject.collection).to_not eq nil
  end

  it 'is expected to search for a specific book by title or author' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:title] == book }
    expect(subject.search('Alfons')).to eq expected_output
  end

  it 'it is expected to search for any available book by title or author' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    expect(subject.available_books).to eq expected_output
  end

  it 'is expected to have a return date within 30 days' do
    book_return_date = YAML.load_file('./lib/data.yml').select { |book| book[:return_date] == Date.today.next_month }
    # binding.pry
    expect(subject.book_return_date).to be < :return_date
  end
end
