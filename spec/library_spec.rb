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
    expected_output = [{ item: { title: 'Star Trek', author: 'Gene Roddenberry' }, available: true,
                         return_date: nil }]

    expect(subject.search('Star Trek')).to eq expected_output
  end
#needs more info, like return date displayed
  it 'is expected to show all available books' do
    expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
    expect(subject.available_books).to eq expected_output
  end
end
