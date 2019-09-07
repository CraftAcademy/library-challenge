require'./lib/library.rb'

describe Library do
    it 'should load data from Yaml file' do
    expect(subject.collection).not_to be nil
    end

    it 'should show a list of the books stored in the book list' do
    expected_output = {book[:item][:title] + " " + [:author]}
    expect(subject.display_books).to eq expected_output
    end

    it 'should be able to find a book' do
    expected_output = 
end
