require './lib/library.rb'
require 'yaml'

=begin
“As a Library,
I want to be have books,
so that people can check out books”
=end

describe Library do
  #initial testing to get us started
  it 'can create an instace of a library' do
    library = Library.new
    expect(library).to be_kind_of Library
  end

  it 'responds to "books"' do
    expect(subject).to respond_to(:books)
  end

  it 'can print a list of books from YAML-file' do
    expected_output = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
    expect(subject.list_books).to eq expected_output
  end

  #Not implementet yet  
  it 'prints only available books' do
    expect(subject.list_available_books).to eq
  end

end
