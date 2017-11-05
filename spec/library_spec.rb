require './lib/library.rb'

describe Library do
  it 'has collection of books on initialize' do
    expect(subject.books).to eq YAML.load_file('./lib/data.yml')
  end
  it '' do
    expect
  end
end
