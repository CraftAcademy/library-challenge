require './lib/library.rb'

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

end
